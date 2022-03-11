import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';
part 'plan.g.dart';
@JsonSerializable()
class Plan {
  final String? name;
  final double? sumCost;
  final double? sumCurrentMoney;
  final DateTime? expectedFinishDate;
  final DateTime? lastUpdatedDate;
  final Status? status;

  Plan({this.name, this.sumCost, this.sumCurrentMoney, this.expectedFinishDate, this.lastUpdatedDate, this.status});

  Plan copyWith(
      {String? name,
      double? sumCost,
      double? sumCurrentMoney,
      DateTime? expectedFinishDate,
      DateTime? lastUpdatedDate,
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
