import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';

part 'plan_dto.g.dart';

@JsonSerializable(explicitToJson: true,)
class PlanDto {
  final String? id;
  final String? name;
  final double? sumCost;
  final double? sumCurrentMoney;
  final DateTime? expectedFinishDate;
  final DateTime? lastUpdatedDate;
  final Status? status;
  final String? userId;

  factory PlanDto.fromJson(Map<String, dynamic> json) => _$PlanDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlanDtoToJson(this);

  PlanDto({
    this.id,
    this.name,
    this.sumCost,
    this.sumCurrentMoney,
    this.expectedFinishDate,
    this.lastUpdatedDate,
    this.status,
    this.userId,
  });

  PlanDto copyWith({
    String? id,
    String? name,
    double? sumCost,
    double? sumCurrentMoney,
    DateTime? expectedFinishDate,
    DateTime? lastUpdatedDate,
    Status? status,
    String? userId,
  }) {
    return PlanDto(
      id: id ?? id,
      name: name ?? name,
      sumCost: sumCost ?? sumCost,
      sumCurrentMoney: sumCurrentMoney ?? sumCurrentMoney,
      expectedFinishDate: expectedFinishDate ?? expectedFinishDate,
      lastUpdatedDate: lastUpdatedDate ?? lastUpdatedDate,
      status: status ?? status,
      userId: userId ?? userId,
    );
  }
}
