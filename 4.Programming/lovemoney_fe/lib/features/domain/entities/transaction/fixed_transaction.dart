import 'package:json_annotation/json_annotation.dart';

part 'fixed_transaction.g.dart';

@JsonSerializable(explicitToJson: true,)
class FixedTransaction {
  final String? id;
  final double? periodTime;

  FixedTransaction({this.id, this.periodTime});

  FixedTransaction copyWith({double? periodTime}) {
    return FixedTransaction(
      periodTime: periodTime ?? this.periodTime,
    );
  }

  factory FixedTransaction.fromJson(Map<String, dynamic> json) =>
      _$FixedTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$FixedTransactionToJson(this);

  @override
  String toString() {
    return 'FixedTransaction{id: $id, periodTime: $periodTime}';
  }
}
