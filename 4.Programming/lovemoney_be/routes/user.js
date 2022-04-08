const express = require("express");
const router = new express.Router();
const userController = require('../controllers/user');
const asyncMiddleware = require('../middlewares/async');
const auth = require("../middlewares/auth");

router.post('/user', asyncMiddleware(userController.createUser));

router.get('/user/information', auth.isAuth, asyncMiddleware(userController.getInformation));

module.exports = router;