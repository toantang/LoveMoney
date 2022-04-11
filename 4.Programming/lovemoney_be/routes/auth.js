const express = require('express');
const router = new express.Router();
const authController = require("../controllers/auth");
const asyncMiddleware = require('../middlewares/async');
const auth = require('../middlewares/auth');
const {AUTH_LOGIN, AUTH_AUTO_LOGIN} = process.env;

router.post(AUTH_LOGIN, asyncMiddleware(authController.login));

router.post(AUTH_AUTO_LOGIN, auth.isAuth, asyncMiddleware(authController.autoLogin));

module.exports = router;