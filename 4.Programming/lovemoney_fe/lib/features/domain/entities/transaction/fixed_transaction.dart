import 'package:lovemoney_fe/features/domain/entities/transaction/transaction.dart';

class FixedTransaction extends Transaction {
  final double? periodTime;

  FixedTransaction(
      {String? name,
        double? cost,
        String? type,
        String? typeTransaction,
        String? note,
        this.periodTime})
      : super(
    name: name,
    cost: cost,
    type: type,
    typeTransaction: typeTransaction,
    note: note,
  );

  @override
  FixedTransaction copyWith({
    String? name,
    double? cost,
    String? type,
    String? typeTransaction,
    String? note,
    double? periodTime,
  }) {
    return FixedTransaction(
      name: name ?? name,
      cost: cost ?? cost,
      type: type ?? type,
      typeTransaction: typeTransaction ?? typeTransaction,
      note: note ?? note,
      periodTime: periodTime ?? periodTime,
    );
  }
}