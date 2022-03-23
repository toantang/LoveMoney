const express = require("express");
const router = new express.Router();
const transactionController = require('../controllers/transaction');
const asyncMiddleware = require('../middlewares/async');

router.post('/transaction', asyncMiddleware(transactionController.createTransaction));

router.put('/transaction/:id', asyncMiddleware(transactionController.updateTransactionById));

module.exports = router;
