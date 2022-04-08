import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';

abstract class AuthRepository {
  Future<ApiResponse<User>>? signUp({required user});
  Future<ApiResponse<User>>? login({required user});
  Future<ApiResponse<User>>? autoLogin({required user});
}