const router = require('express').Router();
const userRoutes = require('./users');
const orderRoutes = require('./orders');
router.use('/users', userRoutes);
router.use('/orders', orderRoutes);

module.exports = router;

