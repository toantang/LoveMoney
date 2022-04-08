import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_result.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/rest_client.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';
import 'package:lovemoney_fe/features/domain/repositories/auth_repository.dart';
import 'package:lovemoney_fe/features/dto/auth_dto/login_dto.dart';
import 'package:lovemoney_fe/features/mapper/auth_mapper/login_mapper.dart';
import '../../../dto/user_dto/register_user_dto.dart';
import 'package:lovemoney_fe/features/mapper/user_mapper/register_user_mapper.dart';

import '../../shared_preferences/authentication_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient = RestClient();
  final AuthenticationStorage _authenticationStorage = AuthenticationStorage();
  final RegisterUserMapper _registerUserMapper = RegisterUserMapper();
  final LoginMapper _loginMapper = LoginMapper();
  
  @override
  Future<ApiResponse<User>>? signUp(
      {required user}) async {
    final RegisterUserDto _userDto = _registerUserMapper.toDTO(user);
    try {
      var response = await _restClient.postMethod('/user', data: _userDto.toJson());

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

  @override
  Future<ApiResponse<User>>? login({required user}) async {
    final LoginDto _loginDto = _loginMapper.toDTO(user);
    try {
      var response = await _restClient.postMethod('/auth/login', data: _loginDto.toJson());
      _authenticationStorage.updateToken(response.data['result']['accessToken']);

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

  @override
  Future<ApiResponse<User>>? autoLogin({required user}) async {
    final LoginDto _loginDto = _loginMapper.toDTO(user);
    try {
      var response = await _restClient.postMethod('/auth/autoLogin', data: _loginDto.toJson());

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
