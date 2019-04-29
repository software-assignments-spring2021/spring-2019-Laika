//db.js

const mongoose = require('mongoose');

//const dbconf = '';

// my schema goes here!
const Item = new mongoose.Schema({
    title: String,
    description: String,
    summary: String,
    notes: [String]
});

mongoose.model('Item', Item);


mongoose.connect('mongodb://localhost/dnd', { useNewUrlParser: true });

//mongoose.connect(dbconf);