/*
  An error-code has formated: abcd
  a: it is serial number of one model
    + if a == 4 => request
    + if a == 1 => user model
    + if a == 2 => token
    + if a == 3 => auth model
    + if a == 4 => Digital wallet model
    + if a == 5 => plan model
    + if a == 6 => transaction model
  b: have two value
    + if b == 1 => action is successful
    + if b == 0 => action is failed
  cd: serial number of error
  
*/

const errorCode = {
    //Request
  BAD_REQUEST: '400',
  UNAUTHORIZED: '401',
  FORBIDDEN: '403',
  NOT_FOUND: '404',
  TOO_MANY_REQUESTS: '429',
  INTERNAL_SERVER_ERROR: '500',

  //User
  USER_NOT_EXISTS: '1001',
  USER_EXISTS: '1101',
  PASSWORD_NOT_MATCH: '1003',
  CREATE_USER_SUCCESSFUL: '1102',
  INVALID_PASSWORD: '1004', 
  UPDATE_USER_SUCCESS: '1103', 
  CREATE_USER_FAILED: '1005', 

  //Token
  NOT_GENERATE_TOKEN: '2001', 

  //Auth
  LOGIN_SUCCESS: '3101', 

  //Digital wallet
  NOT_FOUND_DIGITAL_WALLET: '4001', 
  DIGITAL_WALLET_EXISTS: '4102', 
  CREATE_DIGITAL_WALLET_SUCCESS: '4101', 
  CREATE_DIGITAL_WALLET_FAILED: '4003', 

  //Plan
  CREATE_PLAN_FAILED: '5001', 
  CREATE_PLAN_SUCCESS: '5101', 
  NOT_GET_LIST_PLAN: '5002', 
  GET_LIST_PLAN_SUCCESS: '5102',
  NOT_FOUND_PLAN: '5003', 
  
  //Transaction
  CREATE_TRANSACTION_FAILED: '6001', 
  CREATE_TRANSACTION_SUCCESS: '6101', 
  NOT_FOUND_TRANSACTION: '6002', 
  UPDATE_TRANSACTION_FAILED: '6003', 
  UPDATE_TRANSACTION_SUCCESS: '6102', 
  GET_ALL_TRANSACTION_FAILED: '6004', 
  GET_ALL_TRANSACTION_SUCCESS: '6103', 
  GET_LIST_TRANSACTION_FAILED: '6005', 
  GET_LIST_TRANSACTION_SUCCESS: '6104', 
  DELETE_TRANSACTIOn_FAILED: '6006',
  DELETE_TRANSACTIOn_SUCCESS: '6007',
};

module.exports = errorCode;