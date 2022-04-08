const planDao = require('../dao/plan');
const formatDate = require('../utils/format_date');

const createPlan = async ({
  userId,
  name,
  sumCost,
  sumCurrentMoney,
  expectedFinishDate,
  lastUpdateDate,
  status,
}) => {
  const expectedFinishDateFormated = formatDate.format(expectedFinishDate);
  const lastUpdateDateFormated = formatDate.format(lastUpdateDate);
  const newPlan = {
    userId: userId,
    name: name,
    sumCost: sumCost,
    sumCurrentMoney: sumCurrentMoney,
    expectedFinishDate: expectedFinishDateFormated,
    lastUpdateDate: lastUpdateDateFormated,
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