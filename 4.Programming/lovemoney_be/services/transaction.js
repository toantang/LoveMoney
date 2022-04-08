const formatDate = require('../utils/format_date');
const transactionDao = require('../dao/transaction');

const createTransaction = async ({
  userId,
  name,
  cost,
  date,
  typeTransaction,
  transactionPart,
  note,
}) => {
  const formatedDate = formatDate.format(date);
  const newTransaction = {
    userId: userId,
    name: name,
    cost: cost,
    date: formatedDate,
    typeTransaction: typeTransaction,
    transactionPart: transactionPart,
    note: note,
  };
  console.log(newTransaction);
  const transaction = await transactionDao.createTransaction({newTransaction});
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
  const transactionDb = await transactionDao.findTransactionById(id);
  if (!transactionDb) {
    console.log('can not find transaction have id: ' + id.toString());
    return null;
  }
  const newDate = formatDate.format(date);
  const transaction = await transactionDao.updateTransactionById(
      id,
      {
        userId,
        name,
        cost,
        date: newDate,
        typeTransaction,
        transactionPart,
        note,
      },
  );

  return transaction;
};

const getAllTransaction = async ({
  userId,
  date,
  endDate,
}) => {
  const start = formatDate.format(date);
  const end = formatDate.format(endDate);
  const data = await transactionDao.getAllTransaction({
    userId: userId,
    start,
    end,
  });
  return data;
};

const getListTransaction = async ({
  userId,
  typeTransaction,
  date,
  endDate,
  typeTransactionPart,
}) => {
  const start = formatDate.format(date);
  const end = formatDate.format(endDate);
  const data = await transactionDao.getListTransaction({
    userId,
    typeTransaction,
    start,
    end,
    typeTransactionPart,
  });
  return data;
};
module.exports = {
  createTransaction,
  updateTransactionById,
  getAllTransaction,
  getListTransaction,
}