const express = require('express');
const router = new express.Router();
const transactionController = require('../controllers/transaction');
const asyncMiddleware = require('../middlewares/async');
const {
  TRANSACTION,
  TRANSACTION_UPDATE_BY_ID,
  TRANSACTION_GET_LIST_TRANSACTION,
  TRANSACTION_GET_ALL_TRANSACTION,
  TRANSACTION_DELETE_BY_ID,
} = process.env;

router.post(
    TRANSACTION,
    asyncMiddleware(transactionController.createTransaction),
);

router.put(
    TRANSACTION_UPDATE_BY_ID,
    asyncMiddleware(transactionController.updateTransactionById),
);

router.get(
    TRANSACTION_GET_LIST_TRANSACTION,
    asyncMiddleware(transactionController.getListTransaction),
);

router.get(
    TRANSACTION_GET_ALL_TRANSACTION,
    asyncMiddleware(transactionController.getAllTransaction),
);
router.delete(
    TRANSACTION_DELETE_BY_ID,
    transactionController.deleteTransactionById,
);

module.exports = router;
