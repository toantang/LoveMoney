// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariableTransaction _$VariableTransactionFromJson(Map<String, dynamic> json) =>
    VariableTransaction(
      id: json['id'] as String?,
      name: json['name'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      typePartTransaction: json['typePartTransaction'] as String,
      typeTransaction: json['typeTransaction'] as String,
      note: json['note'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$VariableTransactionToJson(
        VariableTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cost': instance.cost,
      'typePartTransaction': instance.typePartTransaction,
      'typeTransaction': instance.typeTransaction,
      'note': instance.note,
      'date': instance.date,
    };
