const mysql = require('mysql');

//Create Connection
const connection = mysql.createPool({
    host     : '127.0.0.1',
    user     : 'root',
    password : 'root',
    port : '8889',
    database: 'nodemysql'
  });

  
module.exports.connection = connection;