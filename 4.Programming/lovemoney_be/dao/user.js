const User = require('../models/user');

const findUserByEmail = async ({email}) => {
    const lowerEmail = email.toLowerCase();
    const user = await User.findOne({email: lowerEmail});
    if (user) {
        return user;
    }
    return null;
};

module.exports = {
    findUserByEmail,
}