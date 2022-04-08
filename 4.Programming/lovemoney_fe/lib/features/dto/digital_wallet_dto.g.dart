// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_wallet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DigitalWalletDto _$DigitalWalletDtoFromJson(Map<String, dynamic> json) =>
    DigitalWalletDto(
      id: json['id'] as String?,
      owner: json['owner'] as String?,
      codeWallet: json['codeWallet'] as String?,
      accountBalance: (json['accountBalance'] as num?)?.toDouble(),
      digitalType: json['digitalType'] == null
          ? null
          : DigitalType.fromJson(json['digitalType'] as Map<String, dynamic>),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$DigitalWalletDtoToJson(DigitalWalletDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'codeWallet': instance.codeWallet,
      'accountBalance': instance.accountBalance,
      'digitalType': instance.digitalType?.toJson(),
      'userId': instance.userId,
    };
