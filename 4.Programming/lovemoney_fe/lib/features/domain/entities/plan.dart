import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';

part 'plan.g.dart';

@JsonSerializable(explicitToJson: true,)
class Plan {
  final String? id;
  final String? name;
  final double? sumCost;
  final double? sumCurrentMoney;
  final String? expectedFinishDate;
  final String? lastUpdatedDate;
  final Status? status;
  final User? user;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);

  Plan({
    this.id,
    this.name,
    this.sumCost,
    this.sumCurrentMoney,
    this.expectedFinishDate,
    this.lastUpdatedDate,
    this.status,
    this.user,
  });

  Plan copyWith({
    String? id,
    String? name,
    double? sumCost,
    double? sumCurrentMoney,
    String? expectedFinishDate,
    String? lastUpdatedDate,
    Status? status,
    User? user,
  }) {
    return Plan(
      id: id ?? id,
      name: name ?? name,
      sumCost: sumCost ?? sumCost,
      sumCurrentMoney: sumCurrentMoney ?? sumCurrentMoney,
      expectedFinishDate: expectedFinishDate ?? expectedFinishDate,
      lastUpdatedDate: lastUpdatedDate ?? lastUpdatedDate,
      status: status ?? status,
      user: user ?? user,
    );
  }
}
