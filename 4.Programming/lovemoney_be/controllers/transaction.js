const transactionService = require('../services/transaction')

const createTransaction = async (req, res) => {
    const {
        userId,
        name,
        cost,
        date,
        typeTransaction,
        typePartTransaction,
        note,
    } = req.body;

    console.log(req.body);
    const transaction = await transactionService.createTransaction({
        userId, 
        name,
        cost,
        date,
        typeTransaction,
        typePartTransaction,
        note,
    });
    return res.send({status: 1, result: {transaction}});
}

const updateTransactionById = async (req, res) => {
    const {
        userId, 
        name, 
        cost,
        date, 
        typeTransaction, 
        typePartTransaction, 
        note, 
    } = req.body;

    const transaction = await transactionService.createTransaction({
        userId, 
        name,
        cost,
        date,
        typeTransaction,
        typePartTransaction,
        note,
    });

    return res.send({status: 1, result: { transaction }});
}
module.exports = {
    createTransaction,
    updateTransactionById, 
}