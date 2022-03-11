import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';

abstract class AuthRepository {
  Future<ApiResponse<User>>? signUp({required String email, required String password, required String name});
}