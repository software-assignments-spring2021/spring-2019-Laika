//db.js

const mongoose = require('mongoose');

//const dbconf = '';

const Client = new mongoose.Schema({
    id: Number
});

const Corp = new mongoose.Schema({
    id: Number,
    email: String
});

mongoose.model('Client', Client);
mongoose.model('Corp', Corp);


mongoose.connect('mongodb://localhost/laika', { useNewUrlParser: true });

//mongoose.connect(dbconf);