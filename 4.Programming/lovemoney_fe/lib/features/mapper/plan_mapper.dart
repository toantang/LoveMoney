import 'package:lovemoney_fe/core/helper/mapper.dart';
import 'package:lovemoney_fe/features/dto/plan_dto.dart';

import '../domain/entities/plan.dart';

class PlanMapper implements Mapper<Plan, PlanDto> {
  @override
  // ignore: avoid_renaming_method_parameters
  PlanDto toDTO(Plan _plan) {
    PlanDto _planDto = PlanDto();
    return _planDto.copyWith(
      userId: _plan.user?.id,
      name: _plan.name,
      sumCost: _plan.sumCost,
      status: _plan.status,
      expectedFinishDate: _plan.expectedFinishDate,
      sumCurrentMoney: _plan.sumCurrentMoney,
      lastUpdatedDate: _plan.lastUpdatedDate,
    );
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Plan toEntity(PlanDto _planDto) {
    Plan _plan = Plan();
    return _plan.copyWith(
      id: _planDto.id,
      name: _planDto.name,
      status: _planDto.status,
      expectedFinishDate: _planDto.expectedFinishDate,
      sumCost: _planDto.sumCost,
      sumCurrentMoney: _planDto.sumCurrentMoney,
      lastUpdatedDate: _planDto.lastUpdatedDate,
      user: null,
    );
  }
}
