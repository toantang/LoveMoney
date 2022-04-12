const errorCode = require('./error_code');
const message = require('./message');

class ApiError {
  constructor({code, message}) {
    this.code = code;
    this.message = message;
  };
  toString() {
    return 'ApiError{' + this.code.toString() + ': ' + this.message.toString() +
        '}';
  }

  checkErrorCode(inputCode, code) {
    return inputCode === code;
  };

  isSuccessCode(code) {
    var codeString = code.toString();
    if (codeString[1] === '1') {
      return true;
    }
    return false;
  }
};

const createApiError = code => {
  const apiError =
      new ApiError({code: code, message: message.getErrorMessage(code)});
  return apiError;
};

module.exports = {
  ApiError,
  createApiError,
};
