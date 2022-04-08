const digitalWalletDao = require("../dao/digital_wallet");

const findDigitalWalletByUserId = async (userId) => {
  const digitalWallet = await digitalWalletDao.findDigitalWalletByUserId(userId);
  return digitalWallet;
};
const createDigitalWallet = async ({
  userId,
  owner,
  codeWallet,
  accountBalance,
  digitalType,
}) => {
  const newDigitalWallet = {
    userId: userId,
    owner: owner,
    codeWallet: codeWallet,
    accountBalance: accountBalance,
    digitalType: digitalType,
  };
  const digitalWalletExist = await findDigitalWalletByUserId(userId);
  if (digitalWalletExist) {
    console.log('digital wallet of user is exists');
    return digitalWalletExist;
  }
  const digitalWallet = await digitalWalletDao.createDigitalWallet({newDigitalWallet});
  return digitalWallet;
};

module.exports = {
    findDigitalWalletByUserId,
    createDigitalWallet,
}
