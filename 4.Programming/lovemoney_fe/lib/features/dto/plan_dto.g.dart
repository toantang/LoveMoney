// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanDto _$PlanDtoFromJson(Map<String, dynamic> json) => PlanDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      sumCost: (json['sumCost'] as num?)?.toDouble(),
      sumCurrentMoney: (json['sumCurrentMoney'] as num?)?.toDouble(),
      expectedFinishDate: json['expectedFinishDate'] as String?,
      lastUpdatedDate: json['lastUpdatedDate'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$PlanDtoToJson(PlanDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sumCost': instance.sumCost,
      'sumCurrentMoney': instance.sumCurrentMoney,
      'expectedFinishDate': instance.expectedFinishDate,
      'lastUpdatedDate': instance.lastUpdatedDate,
      'status': instance.status,
      'userId': instance.userId,
    };
