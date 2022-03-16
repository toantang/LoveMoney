import 'package:lovemoney_fe/features/domain/entities/language/init_language/english.dart';
import 'package:lovemoney_fe/features/domain/entities/language/init_language/vietnamese.dart';

import '../../../../core/helper/remote_event.dart';

class ChangeVietnamese extends RemoteEvent {
  final Vietnamese vietnamese;

  ChangeVietnamese(this.vietnamese);
}

class ChangeEnglish extends RemoteEvent {
  final English english;

  ChangeEnglish(this.english);
}
