const config = require('../config/config');
const tokenUtil = require('../utils/token');

const isAuth = async (req, res, next) => {
    console.log(req.headers);
    const accessTokenFromHeader = req.headers.authorization;
    if (!accessTokenFromHeader) {
        const nullObject = null;
        return res.send({status: '0001', message: 'Không tìm thấy access token!', result: {nullObject}});
    }

    const accessTokenSecret = process.env.ACCESS_TOKEN_SECRET || config.configToken.accessTokenSecret;

    const verified = await tokenUtil.verifyToken(accessTokenFromHeader, accessTokenSecret);
    if (!verified || verified == null) {
        const nullObject = null;
		return res.send({status: '0002', message: 'jwt expired', result: { nullObject }});
	}
    const email = verified.payload.email;
    req.email = email;
    return next();
};

module.exports = {
    isAuth,
}