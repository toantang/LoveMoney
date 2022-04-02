const transactionService = require('../services/transaction');
const dataOfRequest = require('../utils/data_of_request');

const createTransaction =
    async (req, res) => {
  const {
    userId,
    name,
    cost,
    date,
    typeTransaction,
    note,
    transactionPart,
  } = req.body;

  const transaction = await transactionService.createTransaction({
    userId,
    name,
    cost,
    date,
    typeTransaction,
    transactionPart,
    note,
  });
  return res.send({status: 1, result: {transaction}});
}

const updateTransactionById =
    async (req, res) => {
  const {id} = req.body;

  const {
    userId,
    name,
    cost,
    date,
    typeTransaction,
    transactionPart, 
    note,
  } = req.body;

  const transaction = await transactionService.updateTransactionById(id, {
    userId,
    name,
    cost,
    date,
    typeTransaction,
    transactionPart, 
    note,
  });

  return res.send({status: 1, result: {transaction}});
}

const getListTransaction = async (req, res) => {
  const {
    userId,
    typeTransaction,
    transactionPart,
    date,
    endDate,
  } = dataOfRequest.getDataFromRequest(req);

  var typeTransactionPart = transactionPart.typeTransactionPart;
  const transactions = await transactionService.getListTransaction({
    userId,
    typeTransaction,
    date,
    endDate,
    typeTransactionPart,
  });
  return res.send({status: 1, result: {transactions}});
};

module.exports = {
  createTransaction,
  updateTransactionById,
  getListTransaction,
}