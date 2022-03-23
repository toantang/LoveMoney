const Plan = require('../models/plan');

const createPlan = async({
    userId,
    name,
    sumCost,
    sumCurrentMoney,
    expectedFinishedDate,
    lastUpdateDate,
    status,
}) => {
    const plan = await Plan.create({
        userId, 
        name, 
        sumCost,
        sumCurrentMoney,
        expectedFinishedDate,
        lastUpdateDate,
        status,
    });
    return plan;
}

module.exports = {
    createPlan,
}