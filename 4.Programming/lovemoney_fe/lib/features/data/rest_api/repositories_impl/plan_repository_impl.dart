import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_result.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/rest_client.dart';

import 'package:lovemoney_fe/features/domain/entities/plan.dart';
import 'package:lovemoney_fe/features/dto/plan_dto.dart';
import 'package:lovemoney_fe/features/mapper/plan_mapper.dart';

import '../../../domain/repositories/plan_repository.dart';

class PlanRepositoryImpl implements PlanRepository {
  final RestClient _restClient = RestClient();
  final PlanMapper _planMapper = PlanMapper();

  @override
  Future<ApiResponse<Plan>>? createPlan({required Plan plan}) async {
    try {
      var response = await _restClient.postMethod('/plan', data: plan);
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle(
          json: json,
          rootName: 'plan',
          jsonConverter: (json) => _planMapper.toEntity(PlanDto.fromJson(json)),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<List<Plan>>>? getPlans({required Plan plan}) async {
    PlanDto planDto = _planMapper.toDTO(plan);
    try {
      var response = await _restClient.getMethod('/plan/getListPlan',
          params: planDto.toJson());
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultList(
          json: json,
          rootName: 'plans',
          jsonConverter: (json) => _planMapper.toEntity(PlanDto.fromJson(json)),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<Plan>>? updatePLan({required Plan plan}) async {
    PlanDto planDto = _planMapper.toDTO(plan);
    try {
      var response = await _restClient.putMethod('/plan/update/${plan.id}',
          data: planDto.toJson());
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle(
          json: json,
          rootName: 'plan',
          jsonConverter: (json) => _planMapper.toEntity(PlanDto.fromJson(json)),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}
