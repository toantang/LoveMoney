const mongoose = require('mongoose');
const {TYPE_TRANSACTION, TYPE} = require('../utils/constants');
const { ObjectId } = mongoose.Types;

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
        typePartTransaction: {
            type: String, 
            enum: [
                TYPE.FIXED_TRANSACTION, 
                TYPE.VARIABLE_TRANSACTION, 
            ]
        },
        transactionPart: [
            {
                fixedTransaction: {
                    periodTime: {
                        type: Number,
                        require: true, 
                    }
                },
                variableTransaction: {

                }
            }
        ], 
        note: String, 
    }
)

module.exports = mongoose.model('Transaction', transactionSchema);