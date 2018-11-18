const mysql = require('mysql');
const util = require('util');

//Create Connection
const connection = mysql.createPool({
  host     : '127.0.0.1',
  user     : 'root',
  password : 'root',
  port : '3306',
  database: 'nodemysql'
});

connection.query = util.promisify(connection.query);
  
module.exports.connection = connection;