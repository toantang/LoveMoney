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
};

const getListPlan = async({
    userId, 
}) => {
    const data = await Plan.find({userId: userId});
    return data;
};

const updatePlan = async (id, {
    userId, 
    name,
    sumCost,
    sumCurrentMoney, 
    expectedFinishedDate, 
    lastUpdateDate, 
    status, 
}) => {
    const plan = Plan.findByIdAndUpdate(
        {
            _id: id, 
        }, 
        {
            userId: userId, 
            name: name,
            sumCost: sumCost, 
            sumCurrentMoney: sumCurrentMoney, 
            expectedFinishedDate: expectedFinishedDate,
            lastUpdateDate: lastUpdateDate, 
            status: status, 
        }
     );
     return plan;
}
module.exports = {
    createPlan,
    updatePlan, 
    getListPlan,
}