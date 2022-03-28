import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/variable_transaction.dart';
import '../../../../core/constant/error_const.dart';
import '../../../../core/constant/string_const.dart';
import 'fixed_transaction.dart';

part 'transaction_part.g.dart';

abstract class GetTypeTransactionPart {
  String getTransactionPartByBaseId(String baseDataId);
}

@JsonSerializable()
class TransactionPart implements GetTypeTransactionPart {
  final String? typeTransactionPart; //fixed or variable
  final FixedTransaction? fixedTransaction;
  final VariableTransaction? variableTransaction;

  TransactionPart({
    this.typeTransactionPart,
    this.fixedTransaction,
    this.variableTransaction,
  });

  factory TransactionPart.fromJson(Map<String, dynamic> json) =>
      _$TransactionPartFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionPartToJson(this);

  @override
  String toString() {
    return 'TransactionPart{typeTransactionPart: $typeTransactionPart, '
        'fixedTransaction: $fixedTransaction, variableTransaction: $variableTransaction}';
  }

  @override
  String getTransactionPartByBaseId(String? baseDataId) {
    if (baseDataId == null) {
      return ErrorConst.NULL_BASEDATA_ID;
    }
    switch (baseDataId[0]) {
      case IdTypeTransaction.ID_FIXED_EXPENSE:
      case IdTypeTransaction.ID_FIXED_TURNOVER:
        return TypeTransactionPartConst.FIXED_TRANSACTION;
      default:
        return TypeTransactionPartConst.VARIABLE_TRANSACTION;
    }
  }

  static TransactionPart? getTransactionPart(
      String typeTransactionPart, double? periodTime) {
    if (periodTime == null) {
      return null;
    }
    switch (typeTransactionPart) {
      case TypeTransactionPartConst.FIXED_TRANSACTION:
        return TransactionPart(
          fixedTransaction: FixedTransaction(periodTime: periodTime),
          variableTransaction: null,
        );
      case TypeTransactionPartConst.VARIABLE_TRANSACTION:
        return TransactionPart(
          variableTransaction: VariableTransaction(),
          fixedTransaction: null,
        );
      default:
        return TransactionPart(
          variableTransaction: VariableTransaction(),
          fixedTransaction: null,
        );
    }
  }

  TransactionPart copyWith({
    String? typeTransactionPart,
    FixedTransaction? fixedTransaction,
    VariableTransaction? variableTransaction,
  }) {
    return TransactionPart(
      typeTransactionPart: typeTransactionPart ?? this.typeTransactionPart,
      fixedTransaction: fixedTransaction ?? this.fixedTransaction,
      variableTransaction: variableTransaction ?? this.variableTransaction,
    );
  }
}
