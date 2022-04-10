const security = require('../utils/security');
const userDao = require('../dao/user');

const findUserByEmail = async ({email}) => {
  const user = await userDao.findUserByEmail({email});
  if (user) {
    user.password = security.decrypt(user.password);
  }
  return user;
};

const isPasswordValid = (sentPass, userPass) => {
  return sentPass.toString() === userPass.toString();
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
  return user;
};

module.exports = {
  findUserByEmail,
  isPasswordValid,
  updateInfo,
}