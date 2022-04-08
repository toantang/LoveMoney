const express = require('express');
const router = new express.Router();
const authController = require("../controllers/auth");
const asyncMiddleware = require('../middlewares/async');
const auth = require('../middlewares/auth');

router.post('/auth/login', asyncMiddleware(authController.login));

router.post('/auth/autoLogin', auth.isAuth, asyncMiddleware(authController.autoLogin));

module.exports = router;