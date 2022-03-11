import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_result.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/rest_client.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';
import 'package:lovemoney_fe/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient = RestClient();

  @override
  Future<ApiResponse<User>>? signUp(
      {required String email,
      required String password,
      required String name,
      String? avatarUrl,
      String? phone,
      String? gender,
      String? bio,
      int? age}) async {
    try {
      var response = await _restClient.postMethod('/user', data: {
        'email': email,
        'password': password,
        'name': name,
        'avatarUrl': avatarUrl,
        'phone': phone,
        'gender': gender,
        'bio': bio,
        'age': age,
      });

      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) => ApiResultSingle<User>(
                json: json,
                rootName: 'user',
                jsonConverter: (json) => User.fromJson(json),
              ));
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}
