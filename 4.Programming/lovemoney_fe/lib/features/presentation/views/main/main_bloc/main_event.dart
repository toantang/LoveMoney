import 'package:lovemoney_fe/core/helper/remote_event.dart';

class ChangeIndexViewEvent extends RemoteEvent {
  final int index;
  ChangeIndexViewEvent(this.index);
}