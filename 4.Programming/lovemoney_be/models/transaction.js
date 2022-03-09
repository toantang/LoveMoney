const mongoose = require('mongoose');

const { ObjectId } = mongoose.Types;

const transactionSchema = mongoose.Schema(
    {
        userId: {
            type: ObjectId, 
            ref: "User",
        },
        name: String, 
        cost: Number, 
        date: Date,
        typeTransaction: {
            type: String, 
            enum: [
                EXPENSE_TRANSACTION,
                TURNOVER_TRANSACTION,
            ]
        },
        type: {
            type: String, 
            enum: [
                FIXED_TRANSACTION, 
                VARIABLE_TRANSACTION, 
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