import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_result.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/rest_client.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';
import 'package:lovemoney_fe/features/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient = RestClient();
  
  @override
  Future<ApiResponse<User>>? getInformation({required User user}) async {
    try {
      var response = await _restClient.getMethod('/user/information', params: {
        'email': user.email,
      });
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<User>(
          json: json,
          rootName: 'user',
          jsonConverter: (json) => User.fromJson(json),
        )
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<User>>? updateUser({required User user}) async {
    try {
      var response = await _restClient.putMethod('/user/updateInfo', data: user.toJson());
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<User>(
            json: json,
            rootName: 'user',
            jsonConverter: (json) => User.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}