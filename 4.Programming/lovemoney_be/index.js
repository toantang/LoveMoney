require('dotenv').config();
const express = require('express');
const router = require('./routers/user');
const mongoose = require('mongoose')

mongoose.connect(process.env.DATABASE_URL, {useNewUrlParser: true});
const db = mongoose.connection;
const { PORT } = process.env;

const app = express();

app.use(express.json());
app.use(router);

app.listen(PORT, () => {
    console.log('App is running on port 3000!');
});