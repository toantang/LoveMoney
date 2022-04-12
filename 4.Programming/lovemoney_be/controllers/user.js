const authController = require('../controllers/auth');
const userService = require('../services/user');
const dataOfRequest = require('../utils/data_of_request');

const createUser = authController.register;

const getInformation = async (req, res) => {
  const {email} = dataOfRequest.getDataFromRequest(req);
  const serviceResult = await userService.findUserByEmail({email});
  const code = serviceResult.apiError.code;
  const message = serviceResult.apiError.message;
  const user = serviceResult.data.user;
  res.send({
    status: code,
    message: message, 
    result: {
      user,
    }
  });
};

const updateInfo = async (req, res) => {
  const {
    email,
    password,
    name,
    bio,
    gender,
  } = req.body;
  const serviceResult = await userService.updateInfo({
    email,
    password,
    name,
    bio,
    gender,
  });

  const code = serviceResult.apiError.code;
  const message = serviceResult.apiError.message;
  const user = serviceResult.data.user;
  res.send({status: code, message: message, result: {user}});
};

module.exports = {
  createUser,
  getInformation,
  updateInfo,
}
