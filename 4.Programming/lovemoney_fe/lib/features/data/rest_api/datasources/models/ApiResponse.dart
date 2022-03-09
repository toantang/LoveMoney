import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_error.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_result.dart';

class ApiResponse<T> {
  int? _status;
  ApiResult<T>? _result;
  ApiError? _error;

  bool get hasData => _result?.data != null;

  bool get hasError => _error != null;

  bool get isSucceeded => _status == 1;

  bool get isFailed => _status == 0;

  ApiResponse();

  factory ApiResponse.withResult(
      {Map<String, dynamic>? response,
      ApiResult Function(dynamic json)? resultConverter,}) {
    int status = response!['status'] as int;
    if (status == 1) {
      return ApiResponse()
        .._status = status
        .._result = (resultConverter != null
            ? resultConverter(response['result'])
            : null) as ApiResult<T>?;
    }
    else {
      return ApiResponse()
          .._status = status
          .._error = ApiError.fromJson(response);
    }
  }

  factory ApiResponse.withError(dynamic error) {
    return ApiResponse()
      .._status = 0
      .._error = ApiError(error: error);
  }
}
