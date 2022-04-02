const Plan = require('../models/plan');

const createPlan = async ({
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
  console.log(plan);
  return plan;
};

const getListPlan = async ({
  userId,
  status,
}) => {
  const data = await Plan.find({
    userId: userId,
    'status.code': status.code,
    'status.name': status.name,
  });
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
      });
  return plan;
}; 
module.exports = {
  createPlan,
  updatePlan,
  getListPlan,
}