
import '../../../../../core/util/remote_event.dart';

class UpdateNameEvent extends RemoteEvent {
  final String newName;
  UpdateNameEvent({required this.newName,});
}

class UpdatePasswordEvent extends RemoteEvent {
  final String newPassword;
  UpdatePasswordEvent({required this.newPassword,});
}

class UpdateConfirmPasswordEvent extends RemoteEvent {
  final String confirmPassword;
  UpdateConfirmPasswordEvent({required this.confirmPassword});
}

class UpdateBioEvent extends RemoteEvent {
  final String? bio;
  UpdateBioEvent({this.bio});
}

class UpdateGenderEvent extends RemoteEvent {
  final String? gender;
  UpdateGenderEvent({this.gender});
}