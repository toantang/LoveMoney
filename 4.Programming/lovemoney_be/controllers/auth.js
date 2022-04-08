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
};

const login = async (req, res) => {
    const {
        email, 
        password,
    } = req.body;
    console.log(req.body);
    const {user, accessToken} = await authService.login({email, password});
    res.send({status: 1, result: { user, accessToken }});
};

const autoLogin = async (req, res) => {
    const {email} = req.body;
    const user = await authService.autoLogin({email});
    res.send({status: 1, result: { user }});
};

module.exports = {
    register, 
    login,
    autoLogin,
}