const plan = require('../models/plan');
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
  } = req.query;
  const plans = await planService.getListPlan({userId});
  return res.send({status: 1, result: {plans}});
};
module.exports = {
  createPlan,
  updatePlan,
  getListPlan,
}