const authController = require('../controllers/auth');

module.exports = {
    createUser: authController.register, 
}

