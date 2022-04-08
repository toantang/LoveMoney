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

router.get('/transaction/getAllTransaction', asyncMiddleware(transactionController.getAllTransaction));

module.exports = router;
