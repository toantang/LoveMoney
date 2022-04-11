const express = require("express");
const router = new express.Router();
const userController = require('../controllers/user');
const asyncMiddleware = require('../middlewares/async');
const auth = require("../middlewares/auth");
const {USER, USER_INFORMATION, USER_UPDATE_INFO} = process.env;

router.post(USER, asyncMiddleware(userController.createUser));

router.get(USER_INFORMATION, auth.isAuth, asyncMiddleware(userController.getInformation));

router.put(USER_UPDATE_INFO,  auth.isAuth, asyncMiddleware(userController.updateInfo));

module.exports = router;