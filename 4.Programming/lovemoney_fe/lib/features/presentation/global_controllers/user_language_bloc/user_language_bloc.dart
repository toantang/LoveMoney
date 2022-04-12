import 'dart:async';
import '../../../../core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/global_controllers/user_language_bloc/user_language_event.dart';
import 'package:lovemoney_fe/features/presentation/global_controllers/user_language_bloc/user_language_state.dart';
import '../../../../core/util/language/init_language/english.dart';
import '../../../../core/util/language/init_language/vietnamese.dart';
import '../../../../core/util/language/used_language.dart';
import '../../../../core/util/remote_event.dart';
class UserLanguageBloc extends BlocBase {
  RemoteState state = RemoteState(UsedLanguage());
  final eventController = StreamController<RemoteEvent>();
  final stateController = StreamController<RemoteState>.broadcast();

  UserLanguageBloc() {
    state = RemoteState(Vietnamese());
    eventController.stream.listen((RemoteEvent remoteEvent) {
      changeLanguage(remoteEvent);
    });
  }

  void changeLanguage(RemoteEvent remoteEvent) {
    if (remoteEvent is ChangeVietnamese) {
      state = RemoteState(Vietnamese());
    } else if (remoteEvent is ChangeEnglish) {
      state = RemoteState(English());
    } else {
      state = RemoteState(English());
    }
    stateController.sink.add(state);
  }

  factory UserLanguageBloc.to() => UserLanguageBloc();
  @override
  void dispose() {
    eventController.close();
    stateController.close();
  }
}
