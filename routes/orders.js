
const express = require('express');
const database = require('../database/database');
const orders = express.Router();
const cors = require('cors');

orders.use(cors());

// Get Movies
orders.post('/getmovies', (req, res) => {
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

// Save Order
orders.post('/', (req, res) => {
    const now = new Date();
    const week = now.getWeek();

    const ORDER_QUERY = 'INSERT INTO movie_order SET ?';
    database.connection.query(ORDER_QUERY, {
        date: now,
        location_id: req.body.location,
        week: week,
        total_price: req.body.totalPrice,
        ordered_by: req.body.orderedBy,
        comment: req.body.comment
    }, (err, results) => {
        if (err) {
            return res.status(400).json(err);
        }

        const QUANTITY_QUERY = 'INSERT INTO order_quantity SET ?';
        req.body.moviesList.forEach(async (item) => {
            try {
                var result = await database.connection.query(QUANTITY_QUERY, {
                    movie_order_id: results.insertId,
                    movie_id: item.id,
                    quantity: item.quantity
                });
            } catch(err) {
                throw new Error(err)
            }
        });

        res.status(200).json({
            message: "Successfully Ordered. Thank you for your ordering."
        })

    });

    

    
});

Date.prototype.getWeek = function () {
    var onejan = new Date(this.getFullYear(), 0, 1);
    return Math.ceil((((this - onejan) / 86400000) + onejan.getDay() + 1) / 7);
};

module.exports = orders;






