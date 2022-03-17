import '../../../../core/helper/remote_event.dart';
import '../../../../core/util/language/init_language/english.dart';
import '../../../../core/util/language/init_language/vietnamese.dart';

class ChangeVietnamese extends RemoteEvent {
  final Vietnamese vietnamese;

  ChangeVietnamese(this.vietnamese);
}

class ChangeEnglish extends RemoteEvent {
  final English english;

  ChangeEnglish(this.english);
}
