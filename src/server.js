const express = require('express');
require('./db');
const path = require('path');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const Client = mongoose.model('Client');
const Corp = mongoose.model('Corp');

const app = express();

// Serve the static files from the React app
app.use(express.static(__dirname));
app.use(express.static(path.join(__dirname,'../build/contracts')));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

const port = process.env.PORT || 5000;
app.listen(port);

console.log('App is listening on port ' + port);