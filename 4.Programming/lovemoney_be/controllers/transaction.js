const transactionService = require('../services/transaction')

const createTransaction = async (req, res) => {
    const {
        userId,
        name,
        cost,
        date,
        typeTransaction,
        note,
        transactionPart, 
    } = req.body;

    console.log('body: ');
    console.log(req.body);
    const transaction = await transactionService.createTransaction({
        userId, 
        name,
        cost,
        date,
        typeTransaction,
        transactionPart, 
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
        note, 
    } = req.body;

    const transaction = await transactionService.createTransaction({
        userId, 
        name,
        cost,
        date,
        typeTransaction,
        note,
    });

    return res.send({status: 1, result: { transaction }});
}
module.exports = {
    createTransaction,
    updateTransactionById, 
}