import 'dart:core';

class ApiConfig {
  //Auth config
  static const signup = '/user';
  static const login = '/auth/login';
  static const autoLogin = '/auth/autoLogin'
  ;
  //Digital wallet config
  static const createDigitalWallet = '/digitalWallet';
  static const String getDigitalWalletById = '/digitalWallet/get/';

  //Plan config
  static const createPlan = '/plan';
  static const getListPlan = '/plan/getListPlan';
  static const updatePlanById = '/plan/update/';

  //Transaction config
  static const createTransaction = '/transaction';
  static const updateTransactionById = '/transaction/update/';
  static const getListTransaction = '/transaction/getListTransaction';

  //User config
  static const getInformation = '/user/information';
  static const updateUser = '/user/updateInfo';
}
