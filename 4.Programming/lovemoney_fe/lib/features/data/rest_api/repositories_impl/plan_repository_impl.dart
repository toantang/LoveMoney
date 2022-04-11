import 'package:lovemoney_fe/configs/api_config.dart';
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
    final PlanDto _planDto = _planMapper.toDTO(plan);
    try {
      var response = await _restClient.postMethod(ApiConfig.createPlan,
          data: _planDto.toJson());
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<Plan>(
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
      var response = await _restClient.getMethod(ApiConfig.getListPlan,
          params: planDto.toJson());
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultList<Plan>(
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
      var response = await _restClient.putMethod(
          ApiConfig.updatePlanById + plan.id.toString(),
          data: planDto.toJson());
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<Plan>(
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
