import 'package:json_annotation/json_annotation.dart';

part 'variable_transaction.g.dart';

@JsonSerializable()
class VariableTransaction {
  final String? id;

  VariableTransaction({this.id});

  factory VariableTransaction.fromJson(Map<String, dynamic> json) =>
      _$VariableTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$VariableTransactionToJson(this);

  @override
  String toString() {
    return 'VariableTransaction{id: $id}';
  }
}
