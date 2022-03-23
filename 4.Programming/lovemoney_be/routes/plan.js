const planController = require('../controllers/plan');
const asyncMiddleware = require('../middlewares/async');
const express = require('express');
const router = new express.Router();

router.post('/plan', asyncMiddleware(planController.createPlan));

module.exports = router;