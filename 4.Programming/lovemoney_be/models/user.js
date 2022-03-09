const mongoose = require('mongoose');

const Status = require('./status');
const { ObjectId } = mongoose.Types;

const roleUserSchema = mongoose.Schema(
    {
        type: {
            type: String, 
            enum: [
                STUDENT,
                SINGLE,
                NORMAL_PERSON,
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