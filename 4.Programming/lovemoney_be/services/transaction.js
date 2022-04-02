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
  return transaction;
};

const updateTransactionById = async (id, {
  userId,
  name,
  cost,
  date,
  typeTransaction,
  transactionPart, 
  note,
}) => {
  const transaction = await Transaction.findByIdAndUpdate(
      {
        _id: id,
      },
      {
        userId,
        name,
        cost,
        date,
        typeTransaction,
        transactionPart, 
        note,
      },
      {new: true, runValidators: true},
  );

  return transaction;
};

const getAllTransaction = async ({
  userId, 
  date, 
  endDate,
}) => {
  const data = Transaction.find({
    userId: userId, 
    date: {$gte: date, $lte: endDate}, 
  })

  return data;
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
  return data;
};
module.exports = {
  createTransaction,
  updateTransactionById,
  getAllTransaction,
  getListTransaction,
}