const authService = require("../services/auth");

const register = async (req, res) => {
    console.log(req.body);
    const {
        name,
        email,
        password,
        status,
        birthday,
        gender,
        bio, 
    } = req.body;

    //console.log("email: " + email);
    const user = await authService.register({
        name,
        email,
        password,
        status,
        birthday,
        gender,
        bio, 
    });
    return res.send({ status: 1, result: { user } });
}

module.exports = {
    register, 
}