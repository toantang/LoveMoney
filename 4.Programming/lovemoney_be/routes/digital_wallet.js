const digitalWalletController = require('../controllers/digital_wallet');
const express = require('express');
const router = express.Router();
const asyncMiddleware = require("../middlewares/async");

const {DIGITAL_WALLET, DIGITAL_WALLET_GET_BY_USER_ID} = process.env;

router.post(DIGITAL_WALLET, asyncMiddleware(digitalWalletController.createDigitalWallet));

router.get(DIGITAL_WALLET_GET_BY_USER_ID, asyncMiddleware(digitalWalletController.findDigitalWalletByUserId));

module.exports = router;