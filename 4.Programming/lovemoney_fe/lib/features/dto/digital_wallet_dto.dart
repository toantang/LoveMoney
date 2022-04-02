import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import '../domain/entities/digital_type.dart';

part 'digital_wallet_dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class DigitalWalletDto {
  final String? id;
  final String? owner;
  final String? codeWallet;
  final double? accountBalance;
  final DigitalType? digitalType;
  final String? userId;

  DigitalWalletDto({
    this.id,
    this.owner,
    this.codeWallet,
    this.accountBalance,
    this.digitalType,
    this.userId,
  });

  static final fakeDigitalWallet = DigitalWalletDto(
    owner: AuthBloc.getInstance().user.name,
    codeWallet: "abcxyz",
    accountBalance: 0.0,
    digitalType: DigitalType(name: 'electronic'),
    userId: AuthBloc.getInstance().user.id,
  );

  factory DigitalWalletDto.fromJson(Map<String, dynamic> json) => _$DigitalWalletDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DigitalWalletDtoToJson(this);

  DigitalWalletDto copyWith({
    String? id,
    String? owner,
    String? codeWallet,
    double? accountBalance,
    DigitalType? digitalType,
    String? userId,
  }) {
    return DigitalWalletDto(
      id: id ?? this.id,
      owner: owner ?? this.owner,
      codeWallet: codeWallet ?? this.codeWallet,
      accountBalance: accountBalance ?? this.accountBalance,
      digitalType: digitalType ?? this.digitalType,
      userId: userId ?? this.userId,
    );
  }
}
