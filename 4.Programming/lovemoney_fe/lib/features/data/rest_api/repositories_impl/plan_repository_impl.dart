import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_result.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/rest_client.dart';

import 'package:lovemoney_fe/features/domain/entities/plan.dart';

import '../../../domain/repositories/plan_repository.dart';

class PlanRepositoryImpl implements PlanRepository {
  final RestClient _restClient = RestClient();


  @override
  Future<ApiResponse<Plan>>? createPlan({required Plan plan}) async {
    try {
      var response = await _restClient.postMethod('/plan', data: plan);
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) =>
            ApiResultSingle(json: json,
                rootName: '/plan',
                jsonConverter: (json) => Plan.fromJson(json)),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}