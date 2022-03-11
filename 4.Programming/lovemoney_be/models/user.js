const mongoose = require('mongoose');

const Status = require('./status');
const { ObjectId } = mongoose.Types;

const { ROLE_USER } = require('../utils/constants');

const roleUserSchema = mongoose.Schema(
    {
        type: {
            type: String, 
            enum: [
                'student',
                'single',
                'normal_person',
                /*ROLE_USER.STUDENT,
                ROLE_USER.SINGLE,
                ROLE_USER.NORMAL_PERSON,*/
            ]
        }, 
        name: String, 
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