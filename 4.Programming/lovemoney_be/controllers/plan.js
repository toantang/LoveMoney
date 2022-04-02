const planService = require('../services/plan');
const dataOfRequest = require('../utils/data_of_request');

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

  return res.send({status: 1, result: {plan}});
};

const updatePlan = async (req, res) => {
  const {
    userId,
    name,
    sumCost,
    sumCurrentMoney,
    expectedFinishedDate,
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
        expectedFinishedDate,
        lastUpdateDate,
        status,
      });
      res.send({status: 1, result: { plan }});
};
const getListPlan = async (req, res) => {
  const {
    userId,
    status,
  } = dataOfRequest.getDataFromRequest(req);

  const plans = await planService.getListPlan({userId, status});
  return res.send({status: 1, result: {plans}});
};
module.exports = {
  createPlan,
  updatePlan,
  getListPlan,
}