const security = require('../utils/security');
const userDao = require('../dao/user');
const errorCode = require('../error/error_code');
const ServiceResult = require('./service_result');
const apiError = require('../error/api_error');

const findUserByEmail = async ({email}) => {
  const user = await userDao.findUserByEmail({email});
  if (user) {
    console.log('da tim thay user');
    user.password = security.decrypt(user.password);
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.USER_EXISTS),
      data: {user},
    });
  };
  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.USER_NOT_EXISTS),
    data: { user }, 
  });
};

const isPasswordValid = (sentPass, userPass) => {
  return sentPass.toString() === security.decrypt(userPass);
};

const updateInfo = async ({
  email,
  password,
  name,
  bio,
  gender,
}) => {
  const hashPassword = security.encrypt(password);
  const user = await userDao.updateInfo({
    email,
    hashPassword,
    name,
    bio,
    gender,
  });
  user.password = security.decrypt(user.password);
  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.UPDATE_USER_SUCCESS),
    data: {user},
  });
};

module.exports = {
  findUserByEmail,
  isPasswordValid,
  updateInfo,
}