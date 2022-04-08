const security = require('../utils/security');
const userDao = require('../dao/user');

const findUserByEmail = async ({email}) => {
   const user = userDao.findUserByEmail({email});
   return user;
};

const isPasswordValid = (sentPass, userPass) => {
    return sentPass.toString() === security.decrypt(userPass);
} 

module.exports = {
    findUserByEmail,
    isPasswordValid,
}