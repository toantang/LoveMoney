const planService = require('../services/plan');
const dataOfRequest = require('../utils/data_of_request');

const createPlan = async (req, res) => {
  const {
    userId,
    name,
    sumCost,
    sumCurrentMoney,
    expectedFinishDate,
    lastUpdateDate,
    status,
  } = req.body;

  const plan = await planService.createPlan({
    userId,
    name,
    sumCost,
    sumCurrentMoney,
    expectedFinishDate,
    lastUpdateDate,
    status,
  });

  return res.send({status: 1, result: {plan}});
};

const updatePlan = async (req, res) => {
  const {
    userId,
    name,
    sumCost,
    sumCurrentMoney,
    expectedFinishDate,
    lastUpdateDate,
    status,
  } = req.body;

  const {
    id,
  } = req.params;

  const plan = planService.updatePlan(
      {
        id,
      },
      {
        userId,
        name,
        sumCost,
        sumCurrentMoney,
        expectedFinishDate,
        lastUpdateDate,
        status,
      });
      res.send({status: 1, result: { plan }});
};
const getListPlanByIdStatus = async (req, res) => {
  const {
    userId,
    status,
  } = dataOfRequest.getDataFromRequest(req);

  const plans = await planService.getListPlanByIdStatus({userId, status});
  return res.send({status: 1, result: {plans}});
};
module.exports = {
  createPlan,
  updatePlan,
  getListPlanByIdStatus,
}