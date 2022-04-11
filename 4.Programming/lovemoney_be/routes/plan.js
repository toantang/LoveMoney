const planController = require('../controllers/plan');
const asyncMiddleware = require('../middlewares/async');
const express = require('express');
const router = new express.Router();
const {PLAN, PLAN_UPDATE_BY_ID, PLAN_GET_LIST_PLAN} = process.env;

router.post(PLAN, asyncMiddleware(planController.createPlan));

router.post(PLAN_UPDATE_BY_ID, asyncMiddleware(planController.updatePlan));

router.get(PLAN_GET_LIST_PLAN, asyncMiddleware(planController.getListPlanByIdStatus));

module.exports = router;