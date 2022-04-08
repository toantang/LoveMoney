const User = require('../models/user');
const userDao = require('../dao/user');

const register = async ({
  newUser,
}) => {
  const user = await User.create(newUser);
  return user;
};

module.exports = {
  register,
}