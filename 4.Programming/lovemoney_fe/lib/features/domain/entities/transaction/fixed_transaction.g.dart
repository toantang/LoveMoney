// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixedTransaction _$FixedTransactionFromJson(Map<String, dynamic> json) =>
    FixedTransaction(
      id: json['_id'] as String?,
      periodTime: (json['periodTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FixedTransactionToJson(FixedTransaction instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'periodTime': instance.periodTime,
    };
