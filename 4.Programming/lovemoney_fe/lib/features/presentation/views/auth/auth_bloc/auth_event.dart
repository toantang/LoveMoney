import '../../../../../core/util/remote_event.dart';

class ChangeIndexAuthViewEvent extends RemoteEvent {
  final int index;
  ChangeIndexAuthViewEvent(this.index);
}