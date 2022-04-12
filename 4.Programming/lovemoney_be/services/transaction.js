const formatDate = require('../utils/format_date');
const transactionDao = require('../dao/transaction');
const apiError = require('../error/api_error');
const errorCode = require('../error/error_code');
const ServiceResult = require('./service_result');

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
  if (!transaction) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.CREATE_TRANSACTION_FAILED),
      data: {transaction},
    });
  };

  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.CREATE_TRANSACTION_SUCCESS),
    data: {transaction},
  });
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
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.NOT_FOUND_TRANSACTION),
      data: {transactionDb},
    });
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
  if (!transaction) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.UPDATE_TRANSACTION_FAILED),
      data: { transaction },
    });
  };
  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.UPDATE_TRANSACTION_SUCCESS),
    data: {transaction},
  });
};

const getAllTransaction = async ({
  userId,
  date,
  endDate,
}) => {
  const start = formatDate.format(date);
  const end = formatDate.format(endDate);
  const transactions = await transactionDao.getAllTransaction({
    userId: userId,
    start,
    end,
  });
  if (!transactions) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.GET_ALL_TRANSACTION_FAILED),
      data: {transactions},
    });
  };

  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.GET_ALL_TRANSACTION_SUCCESS),
    data: {transactions},
  });
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
  const transactions = await transactionDao.getListTransaction({
    userId,
    typeTransaction,
    start,
    end,
    typeTransactionPart,
  });
  if (!transactions) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.GET_LIST_TRANSACTION_FAILED),
      data: {transactions},
    });
  };

  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.GET_LIST_TRANSACTION_SUCCESS),
    data: {transactions},
  });
};
module.exports = {
  createTransaction,
  updateTransactionById,
  getAllTransaction,
  getListTransaction,
}