import 'package:json_annotation/json_annotation.dart';

part 'register_user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterUserDto {
  final String? email;
  final String? password;
  final String? name;

  RegisterUserDto({this.email, this.password, this.name});

  factory RegisterUserDto.fromJson(Map<String, dynamic> json) => _$RegisterUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserDtoToJson(this);

  @override
  RegisterUserDto copyWith({String? email, String? password, String? name}) {
    return RegisterUserDto(
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }
}
