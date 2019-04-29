const express = require('express');
require('./db');
const path = require('path');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const open = require('open');
const Client = mongoose.model('Client');
const Corp = mongoose.model('Corp');
const passport = require('passport');
const flash = require('connect-flash')
const LocalStrategy = require('passport-local').Strategy;
const bCrypt = require('bcrypt-nodejs');

const app = express();

// Serve the static files from the React app
app.use(express.static(__dirname));
app.use(express.static(path.join(__dirname,'../build/contracts')));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

const sessionOptions = {
    secret: 'secret for signing session id',
    saveUninitialized: false,
    resave: false
};
app.use(expressSession(sessionOptions));
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

passport.serializeUser(function (user, done) {
    console.log('serializing user: ');
    console.log(user);
    done(null, user._id);
});

passport.deserializeUser(function (id, done) {
    User.findById(id, function (err, user) {
        console.log('deserializing user:', user);
        done(err, user);
    });
});

login(passport);
signup(passport);

/* Handle Login POST */
app.post('/login', passport.authenticate('login', {
    successRedirect: '/profile',
    failureRedirect: '/',
    failureFlash: true
}));

/* Handle Registration POST */
app.post('/signup', passport.authenticate('signup', {
    successRedirect: '/profile',
    failureRedirect: '/signup',
    failureFlash: true
}));

/* Handle Logout */
app.get('/signout', function (req, res) {
    req.logout();
    res.redirect('/');
});

const port = process.env.PORT || 5000;
app.listen(port);

console.log('App is listening on port ' + port);
open('http://localhost:5000');