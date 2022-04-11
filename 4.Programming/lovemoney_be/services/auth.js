const tokenUtil = require('../utils/token');
require('dotenv').config();
const userService = require('../services/user');
const security = require('../utils/security');
const formatDate = require('../utils/format_date');
const authDao = require('../dao/auth');

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
  const userExist = await userService.findUserByEmail({email});
  if (userExist) {
    console.log('User is exist');
    return userExist;
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
  user.password = security.decrypt(user.password);
  return user;
};

const login = async ({
  email,
  password, 
}) => {
  const user = await userService.findUserByEmail({email});
  
  if (!user) {
    console.log('email is not exist');
    return {};
  }
  
  const isValidPassword = userService.isPasswordValid(password, user.password);
  if (!isValidPassword) {
    console.log('password is not valid');
    return {};
  };

  const dataAccessToken = {
    email: email,
  }

  const accessToken = await tokenUtil.generateToken(
      dataAccessToken,
      process.env.ACCESS_TOKEN_SECRET,
      process.env.ACCESS_TOKEN_LIFE,
  );

  if (!accessToken) {
    console.log('Đăng nhập không thành công, vui lòng thử lại.');
    return;
  }

  return {user, accessToken};
};

const autoLogin = async ({email}) => {
  return await userService.findUserByEmail({email});
}
module.exports = {
  register,
  login,
  autoLogin,
}