const mongoose = require('mongoose');
const {TYPE_TRANSACTION, TYPE_TRANSACTION_PART} = require('../utils/constants');
const {ObjectId} = mongoose.Types;

const fixedTransaction = mongoose.Schema({
  periodTime: {
    type: Number,
    require: true,
  },
});

const variableTransaction = new mongoose.Schema({

});

const transactionPartSchema = new mongoose.Schema({
  typeTransactionPart: {
    type: String,
    require: true,
    enum: [
      TYPE_TRANSACTION_PART.FIXED_TRANSACTION,
      TYPE_TRANSACTION_PART.VARIABLE_TRANSACTION,
    ]
  },
  fixedTransaction, 
  variableTransaction, 
});

const transactionSchema = new mongoose.Schema({
  userId: {
    //type: ObjectId,
    type: String,
    ref: 'User',
  },
  name: String,
  cost: Number,
  date: {
    type: Date,
  },
  typeTransaction: {
    type: String,
    enum: [
      TYPE_TRANSACTION.EXPENSE_TRANSACTION,
      TYPE_TRANSACTION.TURNOVER_TRANSACTION,
    ],
  },
  transactionPart: transactionPartSchema, 
  note: String,
})

module.exports = mongoose.model('Transaction', transactionSchema);