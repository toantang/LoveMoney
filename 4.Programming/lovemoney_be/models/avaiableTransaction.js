const mongoose = require('mongoose');

const { ObjectId } = mongoose.Types;

const roleTransactionSchema = mongoose.Schema(
    {
        type: String, 
        levelTransaction: Number, 
    }
);

const avaiableTransactionSchema = mongoose.Schema(
    {
        userId: {
            type: ObjectId,
            require: true, 
        }, 
        name: String, 
        role: roleTransactionSchema,
    }
);

module.exports = mongoose.model('AvaiableTransaction', avaiableTransactionSchema);