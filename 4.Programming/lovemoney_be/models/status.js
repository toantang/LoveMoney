const mongoose = require('mongoose');

const statusSchema = new mongoose.Schema(
    {
        code: {
            type: String, 
            required: true
        },
        name: String,
    }
);

module.exports = statusSchema;