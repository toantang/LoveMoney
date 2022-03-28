const mongoose = require('mongoose');
const {TYPE_TRANSACTION, TYPE_TRANSACTION_PART} = require('../utils/constants');
const { ObjectId } = mongoose.Types;

const fixedTransaction = mongoose.Schema(
    {
        periodTime: {
            type: Number, 
            require: true, 
        }, 
    }
);

const variableTransaction = mongoose.Schema(
    {

    }
);

const transactionSchema = mongoose.Schema(
    {
        userId: {
            type: ObjectId,
            type: String, 
            ref: "User",
        },
        name: String, 
        cost: Number, 
        date: String,
        typeTransaction: {
            type: String, 
            enum: [
                TYPE_TRANSACTION.EXPENSE_TRANSACTION, 
                TYPE_TRANSACTION.TURNOVER_TRANSACTION,
            ],
        },
        transactionPart: {
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
        }, 
        note: String, 
    }
)

module.exports = mongoose.model('Transaction', transactionSchema);