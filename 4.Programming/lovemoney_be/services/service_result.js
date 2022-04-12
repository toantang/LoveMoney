const ApiError = require('../error/api_error');
const errorCode = require('../error/error_code');

class ServiceResult {
  constructor({apiError, data}) {
    this.apiError = apiError;
    this.data = data;
  };
  toString() {
    return 'ServiceResult{' + this.apiError.toString() +
        ', data: ' + this.data + '}';
  }
}

//const serviceResult = new ServiceResult({apiError: ApiError.createApiError(errorCode.BAD_REQUEST), data: 'test data'});
//console.log(serviceResult.toString());
module.exports = ServiceResult;
