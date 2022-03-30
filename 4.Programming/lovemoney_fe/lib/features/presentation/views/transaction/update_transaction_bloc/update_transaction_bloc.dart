import 'dart:async';

import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/formatDate.dart';
import 'package:lovemoney_fe/core/helper/remote_event.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/update_transaction_bloc/update_transaction_event.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/update_transaction_bloc/update_transaction_state.dart';

import '../../../../domain/entities/transaction/transaction.dart';

class UpdateTransactionBloc {
  final Transaction transaction;

  late final UpdateDateBloc updateDateBloc;
  late final UpdateCostBloc updateCostBloc;
  late final UpdateNoteBloc updateNoteBloc;

  String getNote() {
    if (transaction.note == '' || transaction.note == null) {
      return 'no info';
    }
    return transaction.note!;
  }
  UpdateTransactionBloc({required this.transaction}) {
    updateDateBloc = UpdateDateBloc(transaction.date!);
    updateCostBloc = UpdateCostBloc(transaction.cost!);
    updateNoteBloc = UpdateNoteBloc(getNote());
  }
}

class UpdateDateBloc extends BlocBase {
  late UpdateDateState updateDateState;

  final remoteUpdateDateState = StreamController<UpdateDateState>();
  final remoteUpdateDateEvent = StreamController<RemoteEvent>();

  UpdateDateBloc(String date) {
    updateDateState = UpdateDateState(date);
    remoteUpdateDateEvent.stream.listen((RemoteEvent remoteEvent) {
      processNewDate(remoteEvent);
    });
  }

  void processNewDate(RemoteEvent remoteEvent) {
    if (remoteEvent is UpdateDateEvent) {
      updateDateState = UpdateDateState(FormatDate.dateToString(remoteEvent.newDate));
    }
    remoteUpdateDateState.sink.add(updateDateState);
  }
  @override
  void dispose() {
  }
}

class UpdateCostBloc extends BlocBase {
  late UpdateCostState updateCostState;

  final remoteUpdateCostState = StreamController<UpdateCostState>();
  final remoteUpdateCostEvent = StreamController<RemoteEvent>();

  UpdateCostBloc(double cost) {
    updateCostState = UpdateCostState(cost);
    remoteUpdateCostEvent.stream.listen((RemoteEvent remoteEvent) {
      processNewCost(remoteEvent);
    });
  }

  void processNewCost(RemoteEvent remoteEvent) {
    if (remoteEvent is UpdateCostEvent) {
      updateCostState = UpdateCostState(remoteEvent.newCost);
    }
    remoteUpdateCostState.sink.add(updateCostState);
  }
  @override
  void dispose() {
  }
}

class UpdateNoteBloc extends BlocBase {
  late UpdateNoteState updateNoteState;

  final remoteUpdateNoteState = StreamController<UpdateNoteState>();
  final remoteUpdateNoteEvent = StreamController<RemoteEvent>();

  UpdateNoteBloc(String note) {
    print('note: ' + note);
    updateNoteState = UpdateNoteState(note);
    remoteUpdateNoteEvent.stream.listen((RemoteEvent remoteEvent) {
      processNewNote(remoteEvent);
    });
  }

  void processNewNote(RemoteEvent remoteEvent) {
    if (remoteEvent is UpdateNoteEvent) {
      updateNoteState = UpdateNoteState(remoteEvent.newNote);
    }
    remoteUpdateNoteState.sink.add(updateNoteState);
  }
  @override
  void dispose() {
  }
}