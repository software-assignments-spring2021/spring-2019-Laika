//db.js

const mongoose = require('mongoose');

//const dbconf = '';

const Client = new mongoose.Schema({
    id: String,
    username: String,
    password: String
});

const Corp = new mongoose.Schema({
    id: String,
    email: String
});

mongoose.model('Client', Client);
mongoose.model('Corp', Corp);


mongoose.connect('mongodb://localhost/laika', { useNewUrlParser: true });

//mongoose.connect(dbconf);