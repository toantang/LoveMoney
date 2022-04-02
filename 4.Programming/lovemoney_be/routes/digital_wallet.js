const digitalWalletController = require('../controllers/digital_wallet');
const express = require('express');
const router = express.Router();
const asyncMiddleware = require("../middlewares/async");

router.post('/digitalWallet', asyncMiddleware(digitalWalletController.createDigitalWallet));

router.get('/digitalWallet/getByUser/:id', asyncMiddleware(digitalWalletController.findDigitalWalletByUserId));

module.exports = router;