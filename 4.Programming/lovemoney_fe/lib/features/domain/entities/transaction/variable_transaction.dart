import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction.dart';

part 'variable_transaction.g.dart';

@JsonSerializable()
class VariableTransaction extends Transaction {
  VariableTransaction({
    String? id,
    String? name,
    double? cost,
    required String typePartTransaction,
    required String typeTransaction,
    String? note,
    String? date,
  }) : super(
          id: id,
          name: name,
          cost: cost,
    typePartTransaction: typePartTransaction,
          typeTransaction: typeTransaction,
          note: note,
          date: date,
        );

  factory VariableTransaction.fromJson(Map<String, dynamic> json) =>
      _$VariableTransactionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VariableTransactionToJson(this);
}
