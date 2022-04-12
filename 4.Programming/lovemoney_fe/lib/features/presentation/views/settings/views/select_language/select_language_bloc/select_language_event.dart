import 'package:lovemoney_fe/core/enum/enum_const.dart';

import '../../../../../../../core/util/remote_event.dart';

class SelectVietnameseEvent extends RemoteEvent {
  final KeyUsedWord keyUsedWord;
  SelectVietnameseEvent(this.keyUsedWord);
}

class SelectEnglishEvent extends RemoteEvent {
  final KeyUsedWord keyUsedWord;
  SelectEnglishEvent(this.keyUsedWord);
}