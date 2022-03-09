const User = require('../models/user');

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
    const userExists = await User.findOne({email});
    if (userExists) {
        console.log("User is exists");
    }
    const user = await User.create({
        name, 
        email, 
        password,
        status,
        birthday,
        gender,
        bio,
        phone,
    })

    return user;
}

module.exports = {
    register,
}