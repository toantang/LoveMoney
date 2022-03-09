import 'package:lovemoney_fe/features/domain/entities/status.dart';

class Plan {
  final String? _name;
  final double? _sumCost;
  final double? _sumCurrentMoney;
  final DateTime? _expectedFinishDate;
  final DateTime? _lastUpdatedDate;
  final Status? _status;

  Plan(
      {String? name,
      double? sumCost,
      double? sumCurrentMoney,
      DateTime? expectedFinishDate,
      DateTime? lastUpdatedDate,
      Status? status})
      : _name = name,
        _sumCost = sumCost,
        _sumCurrentMoney = sumCurrentMoney,
        _expectedFinishDate = expectedFinishDate,
        _lastUpdatedDate = lastUpdatedDate,
        _status = status;

  Plan copyWith(
      {String? name,
      double? sumCost,
      double? sumCurrentMoney,
      DateTime? expectedFinishDate,
      DateTime? lastUpdatedDate,
      Status? status}) {
    return Plan(
      name: name ?? _name,
      sumCost: sumCost ?? _sumCost,
      sumCurrentMoney: sumCurrentMoney ?? _sumCurrentMoney,
      expectedFinishDate: expectedFinishDate ?? _expectedFinishDate,
      lastUpdatedDate: lastUpdatedDate ?? _lastUpdatedDate,
      status: status ?? _status,
    );
  }
}
