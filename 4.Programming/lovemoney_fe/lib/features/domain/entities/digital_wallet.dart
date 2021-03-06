import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import 'digital_type.dart';

part 'digital_wallet.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class DigitalWallet {
  final String? id;
  final String? owner;
  final String? codeWallet;
  final double? accountBalance;
  final DigitalType? digitalType;
  final User? user;

  DigitalWallet({
    this.id,
    this.owner,
    this.codeWallet,
    this.accountBalance,
    this.digitalType,
    this.user,
  });

  factory DigitalWallet.fromJson(Map<String, dynamic> json) =>
      _$DigitalWalletFromJson(json);

  Map<String, dynamic> toJson() => _$DigitalWalletToJson(this);

  static final fakeDigitalWallet = DigitalWallet(
    owner: AuthBloc.getInstance().user.name,
    codeWallet: "abcxyz",
    accountBalance: 0.0,
    digitalType: DigitalType(name: 'electronic'),
    user: AuthBloc.getInstance().user,
  );

  DigitalWallet copyWith({
    String? id,
    String? owner,
    String? codeWallet,
    double? accountBalance,
    DigitalType? digitalType,
    User? user,
  }) {
    return DigitalWallet(
      id: id ?? this.id,
      owner: owner ?? this.owner,
      codeWallet: codeWallet ?? this.codeWallet,
      accountBalance: accountBalance ?? this.accountBalance,
      digitalType: digitalType ?? this.digitalType,
      user: user ?? this.user,
    );
  }
}
