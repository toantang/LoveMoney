const digitalWalletService = require('../services/digital_wallet');
const dataOfRequest = require('../utils/data_of_request');

const findDigitalWalletByUserId = async (req, res) => {
  const {
    userId,
  } = dataOfRequest.getDataFromRequest(req);

  const digitalWallet =
      await digitalWalletService.findDigitalWalletByUserId(userId);
  return res.send({status: 1, result: {digitalWallet}});
};

const createDigitalWallet = async (req, res) => {
  const {
    userId,
    owner,
    codeWallet,
    accountBalance,
    digitalType,
  } = req.body;

  const digitalWallet = await digitalWalletService.createDigitalWallet({
    userId,
    owner,
    codeWallet,
    accountBalance,
    digitalType,
  });
  return res.send({status: 1, result: {digitalWallet}});
};

module.exports = {
  findDigitalWalletByUserId,
  createDigitalWallet,
}