const mysql = require('mysql2');

const dotenv = require('dotenv');

// Load environment variables
dotenv.config();

const {
  DB_CONNECTION,
  DB_HOST,
  DB_PORT,
  DB_NAME,
  DB_USER,
  DB_PASS,
} = process.env;

const conn = mysql.createConnection({
    host: 'localhost', //'127.0.0.1',
    user: 'root',
    password: '',
    database: 'jaya_store',
    port: 4306 
});

conn.connect(err => {
    if (err) throw err;
    console.log('Database connected');
});

module.exports = conn;