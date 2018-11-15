
const express = require('express');
const database = require('../database/database');
const users = express.Router();
const cors = require('cors');
const isEmpty = require('lodash.isempty');
const validator = require('validator');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const passport = require('passport');

users.use(cors());

function validateInput(data) {
  let errors = {};
  if(validator.isEmpty(data.email)){
    errors.username = 'This filed is required';
  }
  if(!validator.isEmail(data.email)){
    errors.username = 'username is invalid';
  }
  if(validator.isEmpty(data.password)){
    errors.password = 'This filed is required';
  }

  return {
    errors,
    isValid: isEmpty(errors)
  }
}

users.post('/login', (req, res) => {
  const { errors, isValid } = validateInput(req.body); //return isValid or Erorr
  if(!isValid){
    res.status(400).json(errors);
  }

  const SELECT_QUERY = 'SELECT * FROM employee WHERE email = ?';
  const email = req.body.email;
  const password = req.body.password;

  database.connection.query(SELECT_QUERY,  email, (err, results) => {
    if (err) {
      res.status(400).json(err);
    }
    if (results) {
      bcrypt.compare(password, results[0].password)
        .then(function (isMatch) {
          if (isMatch) {
            const payload = {
              id: results[0].id,
              firstName: results[0].First_Name,
              lastName: results[0].Last_Name
            }
            jwt.sign(payload, 'secret', {
              expiresIn: 3600
            }, function (err, token) {
              if (err) console.log('There is some error in token', err);
              else {
                res.json({
                  success: true, 
                  token: `Bearer ${token}`
                });
              }
            });
          }
          else {
            errors.password = 'Incorrect Password';
            return res.status(400).json(errors);
          }
        });
    }
  });
});


module.exports = users;






