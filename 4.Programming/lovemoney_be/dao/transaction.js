const Transaction = require('../models/transaction');
const formatDate = require('../utils/format_date');

const createTransaction = async ({
  newTransaction,
}) => {

  const transaction = await Transaction.create(newTransaction);
  return transaction;
};

const findTransactionById = async (id) => {
    const transaction = await Transaction.findOne({_id: id});
    return transaction;
};

const updateTransactionById = async (id, {
  userId,
  name,
  cost,
  newDate,
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
        newDate,
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
  start, 
  end,
}) => {
  const data = await Transaction.find({
    userId: userId, 
    date: {$gte: start, $lte: end}, 
  });
  return data;
};

const getListTransaction = async ({
  userId,
  typeTransaction,
  start,
  end,
  typeTransactionPart,
}) => {
  const data = await Transaction.find({
    userId: userId,
    typeTransaction: typeTransaction,
    date: {$gte: start, $lte: end}, 
    'transactionPart.typeTransactionPart': typeTransactionPart,
  });
  return data;
};

const deleteTransactionById = async (id) => {
  const transaction = await Transaction.deleteOne({
    _id: id, 
  });
  return transaction;
}
module.exports = {
  createTransaction,
  findTransactionById,
  updateTransactionById,
  getAllTransaction,
  getListTransaction,
  deleteTransactionById, 
}