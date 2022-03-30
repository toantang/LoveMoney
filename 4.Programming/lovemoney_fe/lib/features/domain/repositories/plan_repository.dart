import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/domain/entities/plan.dart';

abstract class PlanRepository {
  Future<ApiResponse<Plan>>? createPlan({required Plan plan});
  Future<ApiResponse<Plan>>? updatePLan({required Plan plan});
  Future<ApiResponse<List<Plan>>>? getPlans({required Plan plan});
}
