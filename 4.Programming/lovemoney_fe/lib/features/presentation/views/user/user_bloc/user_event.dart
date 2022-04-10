import 'package:lovemoney_fe/core/helper/remote_event.dart';

import '../../../../domain/entities/user.dart';

class NewUserEvent extends RemoteEvent {
  final User newUser;
  NewUserEvent({required this.newUser});
}