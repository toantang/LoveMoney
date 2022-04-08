const express = require('express');
const planRouter = require('../routes/plan');
const transactionRouter = require('../routes/transaction');
const userRouter = require('../routes/user');
const digitalWalletRouter = require('../routes/digital_wallet');
const authRouter = require('../routes/auth');

module.exports = function(app) {
    app.use(express.json());
    app.use(planRouter);
    app.use(transactionRouter);
    app.use(userRouter);
    app.use(digitalWalletRouter);
    app.use(authRouter);
}