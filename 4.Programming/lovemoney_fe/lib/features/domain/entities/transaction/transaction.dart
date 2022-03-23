import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final String? id;
  final String? name;
  final double? cost;
  final String typePartTransaction; //fixed or variable
  final String typeTransaction; // expense or turnover
  final String? note;
  final String? date;

  Transaction({
    this.id,
    this.name,
    this.cost,
    required this.typePartTransaction,
    required this.typeTransaction,
    this.note,
    this.date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  Transaction copyWith({
    String? id,
    String? name,
    double? cost,
    String? typePartTransaction,
    String? typeTransaction,
    String? note,
    String? date,
  }) {
    return Transaction(
      id: id ?? id,
      name: name ?? name,
      cost: cost ?? cost,
      typePartTransaction: typePartTransaction ?? this.typePartTransaction,
      typeTransaction: typeTransaction ?? this.typeTransaction,
      note: note ?? note,
      date: date ?? date,
    );
  }

  @override
  String toString() {
    return 'Transaction{id: $id, name: $name, cost: $cost, typePartTransaction: $typePartTransaction, typeTransaction: $typeTransaction, note: $note, date: $date}';
  }
}
