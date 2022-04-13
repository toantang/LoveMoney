import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_error.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_result.dart';

class ApiResponse<T> {
  String? _status;
  String? _message;
  ApiResult<T>? _result;
  ApiError? _error;

  bool get hasData => _result?.data != null;

  bool get hasError => _error != null;

  bool get isSucceeded => _status != null && _status![1] == '1';

  bool get isFailed => _status == null || _status![0] == '0';

  bool get hasMessage => _message != null;

  ApiResponse();

  factory ApiResponse.withResult(
      {Map<String, dynamic>? response,
      ApiResult Function(dynamic json)? resultConverter,}) {
    String status = response!['status'].toString();
    if (status[1] == '1') {
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
      .._status = '0'
      .._error = ApiError(error: error);
  }

  factory ApiResponse.catchError({Map<String, dynamic>? response}) {
    return ApiResponse()
        .._status = response!['status'].toString()
        .._error = ApiError.fromJson(response);
  }

  ApiResult<T>? get result => _result;

  ApiError? get error => _error;
}
