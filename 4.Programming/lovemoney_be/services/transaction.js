const MongoClient = require('mongodb').MongoClient;
const Transaction = require('../models/transaction');

const createTransaction = async ({
  userId,
  name,
  cost,
  date,
  typeTransaction,
  transactionPart,
  note,
}) => {
  const transaction = await Transaction.create({
    userId,
    name,
    cost,
    date,
    typeTransaction,
    transactionPart,
    note,
  });
  console.log('create transaction: ');
  console.log('transaction: ' + transaction);
  return transaction;
};

const updateTransactionById = async (id, {
  userId,
  name,
  cost,
  date,
  typeTransaction,
  note,
}) => {
  const transaction = Transaction.findByIdAndUpdate(
      {
        _id: id,
      },
      {
        userId,
        name,
        cost,
        date,
        typeTransaction,
        note,
      },
      {new: true, runValidators: true},
  );

  return transaction;
};

const getListTransaction = async ({
  userId,
  typeTransaction,
  date,
  endDate,
  typeTransactionPart,
}) => {
  const data = await Transaction.find({
    userId: userId,
    typeTransaction: typeTransaction,
    date: {$gte: date, $lte: endDate}, 
    'transactionPart.typeTransactionPart': typeTransactionPart,
  });
  console.log(data);
  return data;
};
module.exports = {
  createTransaction,
  updateTransactionById,
  getListTransaction,
}