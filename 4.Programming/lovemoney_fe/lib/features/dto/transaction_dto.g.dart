// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDto _$TransactionDtoFromJson(Map<String, dynamic> json) =>
    TransactionDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      typeTransaction: json['typeTransaction'] as String,
      userId: json['userId'] as String?,
      note: json['note'] as String?,
      date: json['date'] as String?,
      transactionPart: json['transactionPart'] == null
          ? null
          : TransactionPart.fromJson(
              json['transactionPart'] as Map<String, dynamic>),
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$TransactionDtoToJson(TransactionDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'cost': instance.cost,
      'typeTransaction': instance.typeTransaction,
      'note': instance.note,
      'date': instance.date,
      'userId': instance.userId,
      'transactionPart': instance.transactionPart?.toJson(),
      'endDate': instance.endDate,
    };
