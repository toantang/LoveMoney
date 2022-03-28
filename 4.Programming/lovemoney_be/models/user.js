const mongoose = require('mongoose');

const Status = require('./status');
const { ObjectId } = mongoose.Types;

const { USER_ROLE_NAME, USER_ROLE_TYPE } = require('../utils/constants');

const roleUserSchema = mongoose.Schema(
    {
        type: {
            type: String, 
            enjum: [
                USER_ROLE_TYPE.USER,
                USER_ROLE_TYPE.ADMIN,
            ]
        }, 
        name: {
            type: String, 
            enum: [
                USER_ROLE_NAME.STUDENT,
                USER_ROLE_NAME.SINGLE,
                USER_ROLE_NAME.NORMAL_PERSON,
            ]
        }, 
    }
);

const userSchema = new mongoose.Schema(
    {
        email: {
            type: String, 
            require: true
        },
        password: {
            type: String, 
            required: true
        },
        userLanguageId: String, 
        name: String,
        age: Number, 
        salt: String,
        birthday: Date, 
        role: roleUserSchema, 
        bio: String, 
        phone: String, 
        gender: String, 
        avatarUrl: String,  
        status: Status, 
    }
);

module.exports = mongoose.model('User', userSchema);