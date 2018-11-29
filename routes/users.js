
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

// Validation Function
function validateInput(data) {
  let errors = {};
  if(validator.isEmpty(data.email)){
    errors.email = 'Email is required';
  }
  if(!validator.isEmail(data.email)){
    errors.email = 'Email is invalid';
  }
  if(validator.isEmpty(data.password)){
    errors.password = 'Password is required';
  }

  return {
    errors,
    isValid: isEmpty(errors)
  }
}
// User Login
users.post('/login', (req, res) => {
  const { errors, isValid } = validateInput(req.body); //return isValid or Erorr
  if(!isValid){
    return res.status(400).json(errors);
  }

  const SELECT_QUERY = 'SELECT * FROM employee WHERE email =  ?';
  const email = req.body.email;

  database.connection.query(SELECT_QUERY,  email, (err, results) => {
    if (err) {
      return res.status(400).json(err);
    }
    if (results.length === 0) {
      errors.email = 'User not found';
      return res.status(404).json(errors);
    } else {
      // Compare Password with Encrypted Hash
      const password = req.body.password;
      bcrypt.compare(password, results[0].password)
        .then(async function (isMatch) {
          if (isMatch) {
            const locations =await getLocations(results[0].id);

            const payload = {
              id: results[0].id,
              First_Name: results[0].First_Name,
              Last_Name: results[0].Last_Name,
              locations: locations
            }

            jwt.sign(payload, 'secret', {
              expiresIn: 3600
            }, function (err, token) {
              if (err) console.log('There is some error in token', err);
              else {
                return res.json({
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
// Get Current User
users.get('/me', passport.authenticate('jwt', { session: false }), function (req, res) {
  return res.json({
    id: req.employee.id,
    First_Name: req.employee.First_Name,
    Last_Name: req.employee.Last_Name,
    email: req.employee.email
  });
});

const getLocations = async (employeeId) => {
  try {
    const LOCATION_ID_QUERY = 'SELECT location_id FROM employee_location WHERE employee_id =' + employeeId;
    var locationIds = await database.connection.query(LOCATION_ID_QUERY);
    
    var locations = [];
    await asyncForEach(locationIds, async (item) => {
      const LOCATION_QUERY = 'SELECT * FROM location WHERE id = ' + item.location_id;
      try {
        var result = await database.connection.query(LOCATION_QUERY);
        locations.push(result[0]);
      } catch(err) {
          throw new Error(err)
      }
    });

    return locations;
  } catch(err) {
    throw new Error(err)
  }
}


async function asyncForEach(array, callback) {
  for (let index = 0; index < array.length; index++) {
      await callback(array[index], index, array);
  }
}

module.exports = users;






