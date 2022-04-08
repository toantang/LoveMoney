const authController = require('../controllers/auth');
const userService = require('../services/user');
const dataOfRequest = require('../utils/data_of_request');

const createUser = authController.register;

const getInformation = async (req, res) => {
    const {email} = dataOfRequest.getDataFromRequest(req);
    const user = await userService.findUserByEmail({email});
    res.send({status: 1, result: { user, }});
};


module.exports = {
    createUser, 
    getInformation,
}

