const planService = require('../services/plan');

const createPlan = async (req, res) => {
    const {
        userId,
        name,
        sumCost,
        sumCurrentMoney,
        expectedFinishedDate,
        lastUpdateDate,
        status,
    } = req.body;

    const plan = await planService.createPlan({
        userId, 
        name,
        sumCost,
        sumCurrentMoney,
        expectedFinishedDate,
        lastUpdateDate,
        status,
    });

    return res.send({status: 1, result: { plan }});
}

module.exports = {
    createPlan,
}