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

  const serviceResult = await planService.createPlan({
    userId,
    name,
    sumCost,
    sumCurrentMoney,
    expectedFinishDate,
    lastUpdateDate,
    status,
  });

  const code = serviceResult.apiError.code;
  const plan = serviceResult.data.plan;
  const message = serviceResult.apiError.message;
  return res.send({status: code, message: message, result: {plan}});
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

  const serviceResult = await planService.updatePlan(
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

      const code = serviceResult.apiError.code;
      const message = serviceResult.apiError.message;
      const plan = serviceResult.data.plan;
      res.send({status: code, message: message, result: { plan }});
};
const getListPlanByIdStatus = async (req, res) => {
  const {
    userId,
    status,
  } = dataOfRequest.getDataFromRequest(req);

  const serviceResult = await planService.getListPlanByIdStatus({userId, status});
  const code = serviceResult.apiError.code;
  const plans = serviceResult.data.plans;
  const message = serviceResult.apiError.message;
  return res.send({status: code, message: message, result: {plans}});
};
module.exports = {
  createPlan,
  updatePlan,
  getListPlanByIdStatus,
}