const digitalWalletDao = require('../dao/digital_wallet');
const ServiceResult = require('./service_result');
const apiError = require('../error/api_error');
const errorCode = require('../error/error_code');

const findDigitalWalletByUserId = async (userId) => {
  const digitalWallet =
      await digitalWalletDao.findDigitalWalletByUserId(userId);
  if (!digitalWallet) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.NOT_FOUND_DIGITAL_WALLET),
      data: {digitalWallet},
    });
  }
  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.DIGITAL_WALLET_EXISTS),
    data: {digitalWallet},
  });
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
  var digitalWallet = await digitalWalletDao.findDigitalWalletByUserId(userId);
  if (digitalWallet) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.DIGITAL_WALLET_EXISTS),
      data: {digitalWallet},
    });
  }

  digitalWallet =
      await digitalWalletDao.createDigitalWallet({newDigitalWallet});
  if (!digitalWallet) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.CREATE_DIGITAL_WALLET_FAILED),
      data: {digitalWallet},
    });
  }
  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.CREATE_DIGITAL_WALLET_SUCCESS),
    data: {digitalWallet},
  });
};

module.exports = {
  findDigitalWalletByUserId,
  createDigitalWallet,
}
