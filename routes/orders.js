
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

// Get Orders
orders.get('/getOrders/:id', (req, res) => {
    const SELECT_QUERY = "SELECT id, week, location_id, total_price, comment FROM movie_order WHERE ordered_by = " + req.params.id;
    database.connection.query(SELECT_QUERY, async (err, results) => {
        if (err) {
            return res.status(400).json(err);
        }

        var resResult = [];

        await asyncForEach(results, async (item) => {
            var OUANTITY_QUERY = "SELECT movie_id, quantity FROM order_quantity WHERE movie_order_id =" + item.id;
            try {
                var quantities = await database.connection.query(OUANTITY_QUERY);
            } catch(err) {
                throw new Error(err)
            }
            var totalQuantity = 0;
            quantities.forEach(item =>{
                totalQuantity += item.quantity;
            });

            var LOCATION_QUERY = "SELECT city, country FROM location WHERE id = " + item.location_id;
            try {
                var location = await database.connection.query(LOCATION_QUERY);
            } catch (err) {
                throw new Error(err);
            }

            var jsonItem = {
                id: item.id,
                week: item.week,
                location: location[0].city + "-" + location[0].country,
                quantities: quantities,
                totalQuantity: totalQuantity,
                totalPrice: item.total_price,
                comment: item.comment
            }

            resResult.push(jsonItem);

        });
        return res.status(200).json(resResult);
    });


})

// Delete Order
orders.delete('/:order_id', (req, res) => {
    const DELETE_ORDER_QUERY = 'DELETE FROM movie_order WHERE id =' + req.params.order_id;
    database.connection.query(DELETE_ORDER_QUERY, (err, results) => {
        if (err) {
            return res.status(400).json(err)
        }

        const DELETE_ORDER_QUANTITY_QUERY = 'DELETE FROM order_quantity WHERE movie_order_id = ' + req.params.order_id;
        database.connection.query(DELETE_ORDER_QUANTITY_QUERY, (err, res2) => {
            if (err) {
                return res.status(400).json(err);
            }

            res.status(200).json({
                result: "success"
            })
        })

    })
    
})

Date.prototype.getWeek = function () {
    var onejan = new Date(this.getFullYear(), 0, 1);
    return Math.ceil((((this - onejan) / 86400000) + onejan.getDay() + 1) / 7);
};

async function asyncForEach(array, callback) {
    for (let index = 0; index < array.length; index++) {
        await callback(array[index], index, array);
    }
}

module.exports = orders;






