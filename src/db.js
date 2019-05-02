//db.js

const mongoose = require('mongoose');

//const dbconf = '';

const Client = new mongoose.Schema({
    id: String,
    username: String,
    password: String,
    trans: [Transaction]
});

const Corp = new mongoose.Schema({
    id: String,
    email: String,
    trans: [Transaction]
});

const Transaction = new mongoose.Schema({
    source: String,
    quantity: Number,
    destination: String
})

mongoose.model('Client', Client);
mongoose.model('Corp', Corp);
mongoose.model('Trans', Transaction);


mongoose.connect('mongodb://localhost/laika', { useNewUrlParser: true });

//mongoose.connect(dbconf);