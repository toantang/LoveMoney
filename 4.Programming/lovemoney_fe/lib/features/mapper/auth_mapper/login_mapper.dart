import 'package:lovemoney_fe/core/helper/mapper.dart';
import 'package:lovemoney_fe/features/dto/auth_dto/login_dto.dart';

import '../../domain/entities/user.dart';

class LoginMapper implements Mapper<User, LoginDto> {
  @override
  LoginDto toDTO(User _user) {
    return LoginDto(
      email: _user.email,
      password: _user.password,
    );
  }

  @override
  User toEntity(LoginDto _dto) {
    // TODO: implement toEntity
    throw UnimplementedError();
  }

}