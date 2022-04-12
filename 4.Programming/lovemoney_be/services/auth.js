const tokenUtil = require('../utils/token');
require('dotenv').config();
const userService = require('../services/user');
const security = require('../utils/security');
const formatDate = require('../utils/format_date');
const authDao = require('../dao/auth');
const userDao = require('../dao/user');
const apiError = require('../error/api_error');
const errorCode = require('../error/error_code');
const ServiceResult = require('./service_result');

const register = async ({
  name,
  email,
  password,
  status,
  birthday,
  gender,
  bio,
  phone,
}) => {
  const findUserServiceResult = await userService.findUserByEmail({email});
  if (findUserServiceResult.data.user) {
    console.log('User is exist');
    const user = findUserServiceResult.data.user;
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.USER_EXISTS),
      data: {user},
    });
  }
  const hashPassword = security.encrypt(password);
  const newUser = {
    name: name,
    email: email,
    password: hashPassword,
    status: status,
    birthday: formatDate.format(birthday),
    gender: gender,
    bio: bio,
    phone: phone,
  };
  const user = await authDao.register({newUser});
  if (!user) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.CREATE_USER_FAILED),
      data: {user},
    });
  }
  user.password = security.decrypt(user.password);
  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.CREATE_USER_SUCCESSFUL),
    data: {user},
  });
};

const login = async ({
  email,
  password,
}) => {
  let accessToken = null;
  const user = await userDao.findUserByEmail({email});

  if (!user) {
    console.log('email is not exist');
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.NOT_FOUND),
      data: {user, accessToken},
    });
  }

  const isValidPassword = userService.isPasswordValid(password, user.password);
  if (!isValidPassword) {
    console.log('password is not valid');
    let user = null;
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.INVALID_PASSWORD),
      data: {user, accessToken},
    });
  };

  const dataAccessToken = {
    email: email,
  }

  accessToken = await tokenUtil.generateToken(
      dataAccessToken,
      process.env.ACCESS_TOKEN_SECRET,
      process.env.ACCESS_TOKEN_LIFE,
  );

  if (!accessToken) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.NOT_GENERATE_TOKEN),
      data: {user, accessToken},
    });
  }

  user.password = security.decrypt(user.password);
  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.LOGIN_SUCCESS),
    data: {user, accessToken},
  });
};

const autoLogin = async ({email}) => {
  const serviceResult = await userService.findUserByEmail({email});
  return serviceResult;
};
module.exports = {
  register,
  login,
  autoLogin,
}