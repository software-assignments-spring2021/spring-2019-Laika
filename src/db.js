//db.js

const mongoose = require('mongoose');

//const dbconf = '';

const Transaction = new mongoose.Schema({
    source: String,
    quantity: Number,
    destination: String
})

const Client = new mongoose.Schema({
    id: String,
    trans: [Transaction]
});

const Corp = new mongoose.Schema({
    id: String,
    email: String,
    trans: [Transaction]
});



mongoose.model('Client', Client);
mongoose.model('Corp', Corp);
mongoose.model('Transaction', Transaction);


mongoose.connect('mongodb://localhost/laika', { useNewUrlParser: true });

//mongoose.connect(dbconf);