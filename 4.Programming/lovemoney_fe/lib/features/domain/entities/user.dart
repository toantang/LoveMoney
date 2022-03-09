import 'package:lovemoney_fe/features/domain/entities/digital_wallet.dart';
import 'package:lovemoney_fe/features/domain/entities/role_user.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';

class User {
  final String? _id;
  final DigitalWallet? _digitalWallet;
  final String? _email;
  final String? _password;
  final String? _name;
  final RoleUser? _roleUser;
  final int? _age;
  final String? _salt;
  final DateTime? _birthday;
  final String? _bio;
  final String? _phone;
  final String? _gender;
  final String? _avatarUrl;
  final Status? _status;

  User(
      {String? id,
      DigitalWallet? digitalWallet,
      String? email,
      String? password,
      String? name,
      RoleUser? roleUser,
      int? age,
      String? salt,
      DateTime? birthday,
      String? bio,
      String? phone,
      String? gender,
      String? avatarUrl,
      Status? status})
      : _id = id,
        _digitalWallet = digitalWallet,
        _email = email,
        _password = password,
        _name = name,
        _roleUser = roleUser,
        _age = age,
        _salt = salt,
        _birthday = birthday,
        _bio = bio,
        _phone = phone,
        _gender = gender,
        _avatarUrl = avatarUrl,
        _status = status;

  User copyWith(
      {String? id,
      DigitalWallet? digitalWallet,
      String? email,
      String? password,
      String? name,
      RoleUser? roleUser,
      int? age,
      String? salt,
      DateTime? birthday,
      String? bio,
      String? phone,
      String? gender,
      String? avatarUrl,
      Status? status}) {
    return User(
      id: id ?? _id,
      digitalWallet: digitalWallet ?? _digitalWallet,
      email: email ?? _email,
      password: password ?? _password,
      name: name ?? _name,
      roleUser: roleUser ?? _roleUser,
      age: age ?? _age,
      salt: salt ?? _salt,
      birthday: birthday ?? _birthday,
      bio: bio ?? _bio,
      phone: phone ?? _phone,
      gender: gender ?? _gender,
      avatarUrl: avatarUrl ?? _avatarUrl,
      status: status ?? _status,
    );
  }
}
