const errorCode = require('./error_code');

const getErrorMessage = code => {
  switch (code) {
      // Request
    case errorCode.BAD_REQUEST:
      return 'Bad request';
    case errorCode.UNAUTHORIZED:
      return 'unauthorized';
    case errorCode.FORBIDDEN:
      return 'forbidden';
    case errorCode.NOT_FOUND:
      return 'can not found';
    case errorCode.TOO_MANY_REQUESTS:
      return 'too many request';
    case errorCode.INTERNAL_SERVER_ERROR:
      return 'internal server error';

    // User
    case errorCode.USER_NOT_EXISTS:
      return 'user is not exists';
    case errorCode.USER_EXISTS:
      return 'user is exists';
    case errorCode.PASSWORD_NOT_MATCH:
      return 'password is not match';
    case errorCode.CREATE_USER_SUCCESSFUL:
      return 'create an user is successful';
    case errorCode.UPDATE_USER_SUCCESS:
      return 'update user is success';
    case errorCode.CREATE_USER_FAILED:
      return 'create an user is failed';

    // Token
    case errorCode.NOT_GENERATE_TOKEN:
      return 'Can not generate token';
    case errorCode.LOGIN_SUCCESS:
      return 'Login is successful';

    // Digital wallet
    case errorCode.CREATE_DIGITAL_WALLET_SUCCESS:
      return 'create digital wallet is success';
    case errorCode.DIGITAL_WALLET_EXISTS:
      return 'Digital wallet is exists';
    case errorCode.NOT_FOUND_DIGITAL_WALLET:
      return 'not found digital wallet';

      // Transaction
    case errorCode.CREATE_TRANSACTION_FAILED:
      return 'create transaction is failed';
    case errorCode.CREATE_TRANSACTION_SUCCESS:
      return 'create transaction is success';
    case errorCode.NOT_FOUND_TRANSACTION:
      return 'not found transaction';
    case errorCode.UPDATE_TRANSACTION_FAILED:
      return 'update transaction is failed';
    case errorCode.UPDATE_TRANSACTION_SUCCESS:
      return 'update transaction is successful';
    case errorCode.GET_ALL_TRANSACTION_FAILED:
      return 'get all transaction is failed';
    case errorCode.GET_ALL_TRANSACTION_SUCCESS:
      return 'get all transaction is successful';
    case errorCode.GET_LIST_TRANSACTION_FAILED:
      return 'get list transaction is failed';
    case errorCode.GET_LIST_TRANSACTION_SUCCESS:
      return 'get list transaction is successful';
    default:
      return 'unspecified error';
  };
};

module.exports = {
  getErrorMessage,
};