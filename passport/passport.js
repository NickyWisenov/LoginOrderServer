// Passport's JWT Strategy
const JWTStrategy = require('passport-jwt').Strategy;
const ExtractJWT = require('passport-jwt').ExtractJwt;

const database = require('../database/database');

const opts = {};

opts.jwtFromRequest = ExtractJWT.fromAuthHeaderAsBearerToken();
opts.secretOrKey = 'secret';

module.exports = function (passport) {
    passport.use(new JWTStrategy(opts, function (jwt_payload, done) {
        SQL_QUERY = 'SELECT * FROM employee WHERE id = ?';
        database.connection.query(SQL_QUERY, jwt_payload.id, function(err, employee) {
            if (err) {
                console.log(err);
            }
            if (employee) {
                return done(null, employee);
            } else {
                return done(null, false);
            }
            
        })
    }));
}