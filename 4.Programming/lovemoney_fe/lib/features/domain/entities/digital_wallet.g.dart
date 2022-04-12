// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DigitalWallet _$DigitalWalletFromJson(Map<String, dynamic> json) =>
    DigitalWallet(
      id: json['_id'] as String?,
      owner: json['owner'] as String?,
      codeWallet: json['codeWallet'] as String?,
      accountBalance: (json['accountBalance'] as num?)?.toDouble(),
      digitalType: json['digitalType'] == null
          ? null
          : DigitalType.fromJson(json['digitalType'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DigitalWalletToJson(DigitalWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'codeWallet': instance.codeWallet,
      'accountBalance': instance.accountBalance,
      'digitalType': instance.digitalType?.toJson(),
      'user': instance.user?.toJson(),
    };
