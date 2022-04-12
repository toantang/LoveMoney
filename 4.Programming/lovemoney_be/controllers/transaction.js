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

  const serviceResult = await transactionService.createTransaction({
    userId,
    name,
    cost,
    date,
    typeTransaction,
    transactionPart,
    note,
  });

  const code = serviceResult.apiError.code;
  const transaction = serviceResult.data.transaction;
  const message = serviceResult.apiError.message;
  return res.send({status: code, message: message, result: {transaction}});
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

  const serviceResult = await transactionService.updateTransactionById(id, {
    userId,
    name,
    cost,
    date,
    typeTransaction,
    transactionPart, 
    note,
  });
  const code = serviceResult.apiError.code;
  const transaction = serviceResult.data.transaction;
  const message = serviceResult.apiError.message;
  return res.send({status: code, message: message, result: {transaction}});
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
  const serviceResult = await transactionService.getListTransaction({
    userId,
    typeTransaction,
    date,
    endDate,
    typeTransactionPart,
  });

  const code = serviceResult.apiError.code;
  const transactions = serviceResult.data.transactions;
  const message = serviceResult.apiError.message;
  return res.send({status: code, message: message,result: {transactions}});
};

const getAllTransaction = async (req, res) => {
  const {
    userId,
    date,
    endDate,
  } = req.body;

  const serviceResult = await transactionService.getAllTransaction({
    userId,
    date,
    endDate,
  });

  const code = serviceResult.apiError.code;
  const transactions = serviceResult.data.transactions;
  const message = serviceResult.apiError.message;
  return res.send({status: code, message: message, result: {transactions}});
}
module.exports = {
  createTransaction,
  updateTransactionById,
  getListTransaction,
  getAllTransaction,
}