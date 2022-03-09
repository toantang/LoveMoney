const mongoose = require('mongoose');

const userLanguageSchema = new mongoose.Schema(
    {
        code: {
            type: String, 
            required: true,
        },
        name: String, 
        description: String 
    }
)

module.exports = mongoose.model('UserLanguage', userLanguageSchema);