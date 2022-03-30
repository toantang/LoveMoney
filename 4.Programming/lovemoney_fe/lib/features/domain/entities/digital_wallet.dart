import 'package:json_annotation/json_annotation.dart';
import 'digital_type.dart';

part 'digital_wallet.g.dart';

@JsonSerializable(explicitToJson: true,)
class DigitalWallet {
  final String? id;
  final String? owner;
  final String? codeWallet;
  final double? accountBalance;
  final DigitalType? digitalType;

  DigitalWallet({this.id, this.owner, this.codeWallet, this.accountBalance, this.digitalType});

  factory DigitalWallet.fromJson(Map<String, dynamic> json) =>
      _$DigitalWalletFromJson(json);

  Map<String, dynamic> toJson() => _$DigitalWalletToJson(this);

  DigitalWallet copyWith(
      {String? id,
      String? owner,
      String? codeWallet,
      double? accountBalance,
      DigitalType? digitalType}) {
    return DigitalWallet(
      id: id ?? id,
      owner: owner ?? owner,
      codeWallet: codeWallet ?? codeWallet,
      accountBalance: accountBalance ?? accountBalance,
      digitalType: digitalType ?? digitalType,
    );
  }
}
