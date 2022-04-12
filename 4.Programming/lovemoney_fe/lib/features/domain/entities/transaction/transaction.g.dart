// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      typeTransaction: json['typeTransaction'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      note: json['note'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      transactionPart: json['transactionPart'] == null
          ? null
          : TransactionPart.fromJson(
              json['transactionPart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cost': instance.cost,
      'typeTransaction': instance.typeTransaction,
      'note': instance.note,
      'date': instance.date?.toIso8601String(),
      'user': instance.user?.toJson(),
      'transactionPart': instance.transactionPart?.toJson(),
    };
