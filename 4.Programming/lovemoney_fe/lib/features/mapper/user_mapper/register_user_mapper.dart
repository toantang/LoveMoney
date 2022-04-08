import 'package:lovemoney_fe/core/helper/mapper.dart';

import '../../domain/entities/user.dart';
import '../../dto/user_dto/register_user_dto.dart';

class RegisterUserMapper implements Mapper<User, RegisterUserDto> {
  @override
  RegisterUserDto toDTO(User user) {
    RegisterUserDto _registerDto = RegisterUserDto();
    return _registerDto.copyWith(
      email: user.email,
      password: user.password,
      name: user.name,
    );
  }

  @override
  User toEntity(RegisterUserDto _dto) {
    // TODO: implement toEntity
    throw UnimplementedError();
  }


}