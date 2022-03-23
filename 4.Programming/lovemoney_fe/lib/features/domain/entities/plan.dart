import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';

part 'plan.g.dart';
@JsonSerializable()
class Plan {
  final String? name;
  final double? sumCost;
  final double? sumCurrentMoney;
  final String? expectedFinishDate;
  final String? lastUpdatedDate;
  final Status? status;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
  Map<String, dynamic> toJson() => _$PlanToJson(this);

  Plan(
      {this.name,
      this.sumCost,
      this.sumCurrentMoney,
      this.expectedFinishDate,
      this.lastUpdatedDate,
      this.status});

  Plan copyWith(
      {String? name,
      double? sumCost,
      double? sumCurrentMoney,
      String? expectedFinishDate,
      String? lastUpdatedDate,
      Status? status}) {
    return Plan(
      name: name ?? name,
      sumCost: sumCost ?? sumCost,
      sumCurrentMoney: sumCurrentMoney ?? sumCurrentMoney,
      expectedFinishDate: expectedFinishDate ?? expectedFinishDate,
      lastUpdatedDate: lastUpdatedDate ?? lastUpdatedDate,
      status: status ?? status,
    );
  }
}
