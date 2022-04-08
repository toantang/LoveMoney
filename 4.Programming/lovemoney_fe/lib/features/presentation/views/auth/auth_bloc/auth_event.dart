import 'package:lovemoney_fe/core/helper/remote_event.dart';

class ChangeIndexAuthViewEvent extends RemoteEvent {
  final int index;
  ChangeIndexAuthViewEvent(this.index);
}