const planDao = require('../dao/plan');

const createPlan = async ({
  userId,
  name,
  sumCost,
  sumCurrentMoney,
  expectedFinishDate,
  lastUpdateDate,
  status,
}) => {
  const newPlan = {
    userId: userId,
    name: name,
    sumCost: sumCost,
    sumCurrentMoney: sumCurrentMoney,
    expectedFinishDate: expectedFinishDate,
    lastUpdateDate: lastUpdateDate,
    status: status,
  };
  const plan = await planDao.createPlan({newPlan});
  console.log(plan);
  return plan;
};

const getListPlanByIdStatus = async ({
  userId,
  status,
}) => {
  const data = await planDao.getListPlanByIdStatus({userId, status});
  console.log('list plans: ');
  console.log(data);
  return data;
};

const updatePlan = async (id, {
  userId,
  name,
  sumCost,
  sumCurrentMoney,
  expectedFinishDate,
  lastUpdateDate,
  status,
}) => {
  const plan = await planDao.updatePlan(userId, {
    name,
    sumCost,
    sumCurrentMoney,
    expectedFinishDate,
    lastUpdateDate,
    status
  });
  return plan;
};
module.exports = {
  createPlan,
  updatePlan,
  getListPlanByIdStatus,
}