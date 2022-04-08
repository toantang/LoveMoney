const Plan = require('../models/plan');

const createPlan = async ({
  newPlan, 
}) => {
  const plan = await Plan.create(newPlan);
  return plan;
};

const getListPlanByIdStatus = async ({
  userId,
  status,
}) => {
  const data = await Plan.find({
    userId: userId,
    'status.code': status.code,
    'status.name': status.name,
  });
  console.log(data);
  return data;
};

const findPlanById = async (id) => {
  const plan = await Plan.findOne({_id: id});
  return plan;
}
const updatePlan = async (id, {
  userId,
  name,
  sumCost,
  sumCurrentMoney,
  expectedFinishDate,
  lastUpdateDate,
  status,
}) => {
  const planDb = await findPlanById(id);
  if (!planDb) {
    return null;
  }
  const plan = await Plan.findByIdAndUpdate(
      {
        _id: id,
      },
      {
        userId: userId,
        name: name,
        sumCost: sumCost,
        sumCurrentMoney: sumCurrentMoney,
        expectedFinishDate: expectedFinishDate,
        lastUpdateDate: lastUpdateDate,
        status: status,
      });
  return plan;
}; 
module.exports = {
  createPlan,
  updatePlan,
  getListPlanByIdStatus,
}