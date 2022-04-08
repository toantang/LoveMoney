const crypto = require('crypto');
require('dotenv').config();
const algorithm = 'aes-256-cbc';
const {PEPER, PEPER_LENGTH} = process.env;

const IV_LENGTH = 16;
//const key = crypto.randomBytes(32);
//const iv = crypto.randomBytes(16);
const key = Buffer.from(PEPER);
const keyString = key.toString('hex').slice(0, PEPER_LENGTH);
const iv = Buffer.from('ee38dd5bc5966ed271cfa0f1cedb4a88');
const ivString = iv.toString('hex').slice(0, IV_LENGTH);


const encrypt = text => {
    const cipher = crypto.createCipheriv(algorithm, Buffer.from(keyString), ivString);
    const updateText = cipher.update(text);
    const encrypted = Buffer.concat([updateText, cipher.final()]);
    return encrypted.toString('hex');
    //return {iv: iv.toString('hex'), encryptedData: encrypted.toString('hex')};
};

const decrypt = text => {
    //const iv = Buffer.from(text.iv, 'hex');
    //const encryptedText = Buffer.from(text.encryptedData, 'hex');
    const encryptedText = Buffer.from(text, 'hex');
    const decipher = crypto.createDecipheriv(algorithm, Buffer.from(keyString), ivString);
    const updateText = decipher.update(encryptedText);
    const decrypted = Buffer.concat([updateText, decipher.final()]);

    return decrypted.toString();
};

module.exports = {
    encrypt, 
    decrypt,
}

