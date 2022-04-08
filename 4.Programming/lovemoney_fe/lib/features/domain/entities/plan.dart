import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';

part 'plan.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Plan {
  final String? id;
  final String? name;
  final double? sumCost;
  final double? sumCurrentMoney;
  final DateTime? expectedFinishDate;
  final DateTime? lastUpdateDate;
  final Status? status;
  final User? user;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);

  @override
  String toString() {
    return 'Plan{id: $id, name: $name, sumCost: $sumCost, sumCurrentMoney: $sumCurrentMoney, '
        'expectedFinishDate: $expectedFinishDate, lastUpdatedDate: $lastUpdateDate, status: $status, user: $user}';
  }

  Plan({
    this.id,
    this.name,
    this.sumCost,
    this.sumCurrentMoney,
    this.expectedFinishDate,
    this.lastUpdateDate,
    this.status,
    this.user,
  });

  Plan copyWith({
    String? id,
    String? name,
    double? sumCost,
    double? sumCurrentMoney,
    DateTime? expectedFinishDate,
    DateTime? lastUpdateDate,
    Status? status,
    User? user,
  }) {
    return Plan(
      id: id ?? this.id,
      name: name ?? this.name,
      sumCost: sumCost ?? this.sumCost,
      sumCurrentMoney: sumCurrentMoney ?? this.sumCurrentMoney,
      expectedFinishDate: expectedFinishDate ?? this.expectedFinishDate,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
