import 'dart:async';

import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/remote_event.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends BlocBase {
  ChangeIndexViewState changeIndexViewState = ChangeIndexViewState(0);

  final remoteHomeState = StreamController<ChangeIndexViewState>();
  final remoteHomeEvent = StreamController<ChangeIndexViewEvent>();

  MainBloc() {
    remoteHomeEvent.stream.listen((RemoteEvent remoteEvent) {
      _changeIndexCurrentView(remoteEvent);
    });
  }

  void _changeIndexCurrentView(RemoteEvent remoteEvent) {
    if (remoteEvent is ChangeIndexViewEvent) {
      changeIndexViewState = ChangeIndexViewState(remoteEvent.index);
    }
    remoteHomeState.sink.add(changeIndexViewState);
  }
  @override
  void dispose() {
  }

}