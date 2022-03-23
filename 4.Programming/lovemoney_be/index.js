require('dotenv').config();
const express = require('express');
//const router = require('./routers/transaction');
const mongoose = require('mongoose')

mongoose.connect(process.env.DATABASE_URL, {useNewUrlParser: true});
const db = mongoose.connection;
const { PORT } = process.env;

const app = express();
require('./routes/routes')(app);
app.use(express.json());

app.listen(PORT, () => {
    console.log('App is running on port 3000!');
});