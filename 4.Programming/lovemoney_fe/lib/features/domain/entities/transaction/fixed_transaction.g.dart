// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixedTransaction _$FixedTransactionFromJson(Map<String, dynamic> json) =>
    FixedTransaction(
      id: json['id'] as String?,
      name: json['name'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      typePartTransaction: json['typePartTransaction'] as String,
      typeTransaction: json['typeTransaction'] as String,
      note: json['note'] as String?,
      date: json['date'] as String?,
      periodTime: (json['periodTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FixedTransactionToJson(FixedTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cost': instance.cost,
      'typePartTransaction': instance.typePartTransaction,
      'typeTransaction': instance.typeTransaction,
      'note': instance.note,
      'date': instance.date,
      'periodTime': instance.periodTime,
    };
