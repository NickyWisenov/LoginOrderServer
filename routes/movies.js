
const express = require('express');
const database = require('../database/database');
const movies = express.Router();
const cors = require('cors');

movies.use(cors());

// Get Movies
movies.post('/getmovies', (req, res) => {
    const MOVIE_QUERY = 'SELECT id, name, price FROM movie WHERE active = "1"';
    database.connection.query(MOVIE_QUERY, (err, results) => {
        if (err) {
            return res.status(400).json(err);
        }

        if (results.length === 0) {
            errors.movies = 'There are no Movies';
            return res.status(404).json(errors);
        } else {
            return res.status(200).json(results);
        }
    });
});

module.exports = movies;






