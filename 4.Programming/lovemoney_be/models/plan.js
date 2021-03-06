const mongoose = require('mongoose');
const Status = require('../models/status');

const { ObectId } = mongoose.Types;

const planSchema = mongoose.Schema(
    {
        userId: {
            //type: ObectId,
            type: String, 
            ref: "User",
        },
        name: String,
        sumCost: Number,
        sumCurrentMoney: Number,
        expectedFinishDate: Date,
        lastUpdateDate: Date,
        status: Status,
    }
)

module.exports = mongoose.model('Plan', planSchema);