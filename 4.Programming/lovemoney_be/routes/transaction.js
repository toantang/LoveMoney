const express = require('express');
const router = new express.Router();
const transactionController = require('../controllers/transaction');
const asyncMiddleware = require('../middlewares/async');

router.post(
    '/transaction', asyncMiddleware(transactionController.createTransaction));

router.put(
    '/transaction/update/:id',
    asyncMiddleware(transactionController.updateTransactionById));

router.get(
    '/transaction/getListTransaction',
    asyncMiddleware(transactionController.getListTransaction));

module.exports = router;
