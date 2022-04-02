const express = require('express');
var planRouter = require('../routes/plan');
var transactionRouter = require('../routes/transaction');
var userRouter = require('../routes/user');
var digitalWalletRouter = require('../routes/digital_wallet');

module.exports = function(app) {
    app.use(express.json());
    app.use(planRouter);
    app.use(transactionRouter);
    app.use(userRouter);
    app.use(digitalWalletRouter);
}