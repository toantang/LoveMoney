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
      expectedFinishDate: json['expectedFinishDate'] == null
          ? null
          : DateTime.parse(json['expectedFinishDate'] as String),
      lastUpdateDate: json['lastUpdateDate'] == null
          ? null
          : DateTime.parse(json['lastUpdateDate'] as String),
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
      'expectedFinishDate': instance.expectedFinishDate?.toIso8601String(),
      'lastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'status': instance.status?.toJson(),
      'userId': instance.userId,
    };
