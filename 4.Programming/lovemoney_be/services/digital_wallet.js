const DigitalWallet = require('../models/digitalWallet');

const findDigitalWalletByUserId = async (userId) => {
  const digitalWallet = await DigitalWallet.findOne({
    userId: userId,
  })

  return digitalWallet;
};
const createDigitalWallet = async ({
  userId,
  owner,
  codeWallet,
  accountBalance,
  digitalType,
}) => {
  if (await findDigitalWalletByUserId(userId)) {
    console.log('digital wallet of user is exists');
    return null;
  }
  const digitalWallet = await DigitalWallet.create({
    userId,
    owner,
    codeWallet,
    accountBalance,
    digitalType,
  });
  return digitalWallet;
};

module.exports = {
    findDigitalWalletByUserId,
    createDigitalWallet,
}
