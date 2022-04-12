
import '../../../../../core/util/remote_event.dart';

class ChangeIndexViewEvent extends RemoteEvent {
  final int index;
  ChangeIndexViewEvent(this.index);
}