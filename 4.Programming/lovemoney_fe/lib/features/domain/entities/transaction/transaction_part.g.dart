// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionPart _$TransactionPartFromJson(Map<String, dynamic> json) =>
    TransactionPart(
      typeTransactionPart: json['typeTransactionPart'] as String?,
      fixedTransaction: json['fixedTransaction'] == null
          ? null
          : FixedTransaction.fromJson(
              json['fixedTransaction'] as Map<String, dynamic>),
      variableTransaction: json['variableTransaction'] == null
          ? null
          : VariableTransaction.fromJson(
              json['variableTransaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionPartToJson(TransactionPart instance) =>
    <String, dynamic>{
      'typeTransactionPart': instance.typeTransactionPart,
      'fixedTransaction': instance.fixedTransaction?.toJson(),
      'variableTransaction': instance.variableTransaction?.toJson(),
    };
