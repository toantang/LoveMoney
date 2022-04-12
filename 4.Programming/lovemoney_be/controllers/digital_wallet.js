const digitalWalletService = require('../services/digital_wallet');
const dataOfRequest = require('../utils/data_of_request');

const findDigitalWalletByUserId = async (req, res) => {
  const {
    userId,
  } = dataOfRequest.getDataFromRequest(req);

  const serviceResult =
      await digitalWalletService.findDigitalWalletByUserId(userId);
  const code = serviceResult.apiError.code;
  const message = serviceResult.apiError.message;
  const digitalWallet = serviceResult.data.digitalWallet;
  return res.send({status: code, message: message, result: {digitalWallet}});
};

const createDigitalWallet = async (req, res) => {
  const {
    userId,
    owner,
    codeWallet,
    accountBalance,
    digitalType,
  } = req.body;

  const serviceResult = await digitalWalletService.createDigitalWallet({
    userId,
    owner,
    codeWallet,
    accountBalance,
    digitalType,
  });
  const code = serviceResult.apiError.code;
  const digitalWallet = serviceResult.data.digitalWallet;
  const message = serviceResult.apiError.message;
  return res.send({status: code, message: message, result: {digitalWallet}});
};

module.exports = {
  findDigitalWalletByUserId,
  createDigitalWallet,
}