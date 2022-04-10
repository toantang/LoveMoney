class UpdateNameState {
  final String newName;
  UpdateNameState({required this.newName,});
}

class UpdatePasswordState {
  final String newPassword;
  UpdatePasswordState({required this.newPassword,});
}

class UpdateBioState {
  final String? bio;
  UpdateBioState({this.bio});
}
class UpdateGenderState {
  final String? gender;
  UpdateGenderState({this.gender});
}