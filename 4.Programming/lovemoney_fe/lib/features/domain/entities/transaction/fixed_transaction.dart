import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction.dart';

part 'fixed_transaction.g.dart';

@JsonSerializable()
class FixedTransaction extends Transaction {
  final double? periodTime;

  FixedTransaction({
    String? id,
    String? name,
    double? cost,
    required String typePartTransaction,
    required String typeTransaction,
    String? note,
    String? date,
    this.periodTime,
  }) : super(
          id: id,
          name: name,
          cost: cost,
    typePartTransaction: typePartTransaction,
          typeTransaction: typeTransaction,
          note: note,
          date: date,
        );

  factory FixedTransaction.fromJson(Map<String, dynamic> json) =>
      _$FixedTransactionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FixedTransactionToJson(this);

  @override
  FixedTransaction copyWith({
    String? id,
    String? name,
    double? cost,
    String? typePartTransaction,
    String? typeTransaction,
    String? note,
    double? periodTime,
    String? date,
  }) {
    return FixedTransaction(
      id: id ?? id,
      name: name ?? name,
      cost: cost ?? cost,
      typePartTransaction: typePartTransaction ?? super.typePartTransaction,
      typeTransaction: typeTransaction ?? super.typeTransaction,
      note: note ?? note,
      periodTime: periodTime ?? periodTime,
      date: date ?? date,
    );
  }
}
