const mongoose = require('mongoose')

const { ObjectId } = mongoose.Types;

const digitalTypeSchema = mongoose.Schema(
    {
        name: String,
    }
);

const digitalWalletSchema = mongoose.Schema(
    {
        userId: {
            //type: ObjectId, 
            type: String, 
            ref: 'users',
        }, 
        owner: String,
        codeWallet: String,
        accountBalance: Number, 
        digitalType: digitalTypeSchema, 
    }
)

module.exports = mongoose.model('DigitalWallet', digitalWalletSchema);