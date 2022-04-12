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

    const serviceResult = await authService.register({
        name,
        email,
        password,
        status,
        birthday,
        gender,
        bio, 
    });
    console.log(serviceResult);
    const user = serviceResult.data.user;
    const code = serviceResult.apiError.code;
    const message = serviceResult.apiError.message;
    return res.send({ status: code, message: message, result: { user } });
};

const login = async (req, res) => {
    const {
        email, 
        password,
    } = req.body;
    console.log(req.body);
    const serviceResult = await authService.login({email, password});
    const user = serviceResult.data.user;
    const accessToken = serviceResult.data.accessToken;
    const code = serviceResult.apiError.code
    const message = serviceResult.apiError.message;
    console.log(user);
    console.log(accessToken);
    console.log("===================")
    return res.send({status: code, message: message, result: { user, accessToken }});
};

const autoLogin = async (req, res) => {
    const {email} = req.body;
    const serviceResult = await authService.autoLogin({email});
    const user = serviceResult.data.user;
    const message = serviceResult.apiError.message;
    const code = serviceResult.apiError.code;
    console.log(user);
    console.log(code);
    return res.send({status: code, message: message, result: {user}, });
};

module.exports = {
    register, 
    login,
    autoLogin,
}