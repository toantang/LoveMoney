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
  final DateTime? lastUpdateDate;
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
    this.lastUpdateDate,
    this.status,
    this.userId,
  });

  PlanDto copyWith({
    String? id,
    String? name,
    double? sumCost,
    double? sumCurrentMoney,
    DateTime? expectedFinishDate,
    DateTime? lastUpdateDate,
    Status? status,
    String? userId,
  }) {
    return PlanDto(
      id: id ?? this.id,
      name: name ?? this.name,
      sumCost: sumCost ?? this.sumCost,
      sumCurrentMoney: sumCurrentMoney ?? this.sumCurrentMoney,
      expectedFinishDate: expectedFinishDate ?? this.expectedFinishDate,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      status: status ?? this.status,
      userId: userId ?? this.userId,
    );
  }
}
