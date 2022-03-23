const express = require("express");
const router = new express.Router();
const userController = require('../controllers/user');
const asyncMiddleware = require('../middlewares/async');

router.post('/user', asyncMiddleware(userController.createUser));

module.exports = router;