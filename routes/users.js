
const express = require('express');
const database = require('../database/database');
const users = express.Router();
const cors = require('cors');
const isEmpty = require('lodash.isempty');
const validator = require('validator');

users.use(cors());

function validateInput(data) {
  let errors = {};
  if(validator.isEmpty(data.username)){
    errors.username = 'This filed is required';
  }
  if(!validator.isEmail(data.username)){
    errors.username = 'username is in Valid';
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

  const SELECT_QUERY = 'select * from employee where username = ? and password = ?';
  const username = req.body.username;
  const password = req.body.password;

  database.connection.query(SELECT_QUERY,  [username, password],(err, results) => {
          

   });
});


module.exports = users;






