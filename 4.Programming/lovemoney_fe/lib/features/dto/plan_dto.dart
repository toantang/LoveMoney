import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';

part 'plan_dto.g.dart';

@JsonSerializable()
class PlanDto {
  final String? id;
  final String? name;
  final double? sumCost;
  final double? sumCurrentMoney;
  final String? expectedFinishDate;
  final String? lastUpdatedDate;
  final Status? status;
  final String? userId;

  //factory Dto.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
  //Map<String, dynamic> toJson() => _$PlanToJson(this);

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
    String? expectedFinishDate,
    String? lastUpdatedDate,
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
