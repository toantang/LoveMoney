import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/variable_transaction.dart';
import '../../../../core/constant/error_const.dart';
import '../../../../core/constant/string_const.dart';
import 'fixed_transaction.dart';

part 'transaction_part.g.dart';

abstract class GetTypeTransactionPart {
  String getTypeTransactionPartByBaseId(String baseDataId);
}

@JsonSerializable(explicitToJson: true,)
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
  String getTypeTransactionPartByBaseId(String? baseDataId) {
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

  static TransactionPart getTransactionPart(String typeTransactionPart, double? periodTime) {
    TransactionPart transactionPart = TransactionPart(typeTransactionPart: typeTransactionPart, );

    if (periodTime == null) {
      return transactionPart.copyWith(
        variableTransaction: VariableTransaction(),
        fixedTransaction: null,
      );
    }
    switch (typeTransactionPart) {
      case TypeTransactionPartConst.FIXED_TRANSACTION:
        return transactionPart.copyWith(
          fixedTransaction: FixedTransaction(periodTime: periodTime),
          variableTransaction: null,
        );
      case TypeTransactionPartConst.VARIABLE_TRANSACTION:
        return transactionPart.copyWith(
          variableTransaction: VariableTransaction(),
          fixedTransaction: null,
        );
      default:
        return transactionPart.copyWith(
          variableTransaction: VariableTransaction(),
          fixedTransaction: null,
        );
    }
  }

  static getDefaultTransactionPart(String typeTransactionPart) {
    return TransactionPart(
      typeTransactionPart: typeTransactionPart,
      fixedTransaction: null,
      variableTransaction: null,
    );
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
