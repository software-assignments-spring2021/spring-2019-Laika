const express = require('express');
require('./db');
const path = require('path');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const Item = mongoose.model('Item');

const app = express();

// Serve the static files from the React app
app.use(express.static(path.join(__dirname, '../')));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

// Handles any requests that don't match the ones above
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname + '../index.html'));
});

const port = process.env.PORT || 5000;
app.listen(port);

console.log('App is listening on port ' + port);