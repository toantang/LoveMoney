import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction_part.dart';

import '../user.dart';

part 'transaction.g.dart';

// not use String? _id because this library will not auto create field _id
@JsonSerializable()
class Transaction {
  final String? id;
  final String? name;
  final double? cost;
  final String typeTransaction; // expense or turnover
  final String? note;
  final String? date;
  final User? user;
  final TransactionPart? transactionPart;

  Transaction({
    this.id,
    this.name,
    this.cost,
    required this.typeTransaction,
    this.user,
    this.note,
    this.date,
    this.transactionPart,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  Transaction copyWith({
    String? id,
    String? name,
    double? cost,
    String? typeTransaction,
    String? note,
    String? date,
    User? user,
    TransactionPart? transactionPart,
  }) {
    return Transaction(
      id: id ?? id,
      name: name ?? name,
      cost: cost ?? cost,
      typeTransaction: typeTransaction ?? this.typeTransaction,
      note: note ?? note,
      date: date ?? date,
      user: user ?? user,
      transactionPart: transactionPart ?? transactionPart,
    );
  }

  @override
  String toString() {
    return 'Transaction{id: $id, name: $name, cost: $cost, typeTransaction: $typeTransaction, '
        'note: $note, date: $date, user: $user, transactionPart: $transactionPart}';
  }
}
