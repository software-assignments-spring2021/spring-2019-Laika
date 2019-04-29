//db.js

const mongoose = require('mongoose');

//const dbconf = '';

const Client = new mongoose.Schema({
    id: number
});

const Corp = new mongoose.Schema({
    id: number,
    email: string
});

mongoose.model('Client', Client);
mongoose.model('Copr', Corp);


mongoose.connect('mongodb://localhost/laika', { useNewUrlParser: true });

//mongoose.connect(dbconf);