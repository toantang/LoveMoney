const DigitalWallet = require('../models/digitalWallet');

const findDigitalWalletByUserId = async (userId) => {
  const digitalWallet = await DigitalWallet.findOne({
    userId: userId,
  })

  return digitalWallet;
};

const createDigitalWallet = async ({
  newDigitalWallet,
}) => {
  const digitalWallet = await DigitalWallet.create(newDigitalWallet);
  return digitalWallet;
};

module.exports = {
    findDigitalWalletByUserId,
    createDigitalWallet,
}
