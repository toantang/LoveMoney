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
}

const updateTransactionById = async (
    id,
    {
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
}
module.exports = {
    createTransaction,
    updateTransactionById,
}