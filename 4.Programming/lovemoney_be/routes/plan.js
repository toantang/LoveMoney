const planController = require('../controllers/plan');
const asyncMiddleware = require('../middlewares/async');
const express = require('express');
const router = new express.Router();

router.post('/plan', asyncMiddleware(planController.createPlan));

router.post('/plan/update/:id', asyncMiddleware(planController.updatePlan));

router.get('/plan/getListPlan', asyncMiddleware(planController.getListPlanByIdStatus));

module.exports = router;