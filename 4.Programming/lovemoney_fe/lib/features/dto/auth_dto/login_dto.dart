import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginDto {
  final String? email;
  final String? password;

  LoginDto({this.email, this.password});

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  LoginDto copyWith({String? email, String? password}) {
    return LoginDto(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
