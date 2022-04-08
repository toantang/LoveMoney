import '../../data/rest_api/datasources/models/api_response.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<ApiResponse<User>>? getInformation({required User user});
}