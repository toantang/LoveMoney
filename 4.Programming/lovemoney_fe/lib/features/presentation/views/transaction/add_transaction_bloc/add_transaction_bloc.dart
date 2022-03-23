import 'dart:async';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/formatDate.dart';
import 'package:lovemoney_fe/core/helper/manager_bloc.dart';
import 'package:lovemoney_fe/core/helper/remote_event.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/transaction_repository_impl.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/add_transaction_bloc/add_transaction_event.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/add_transaction_bloc/add_transaction_state.dart';

import '../../../../../core/constant/string_const.dart';

class AddTransactionBloc extends ManagerBloc {
  final TypeCostBloc typeCostBloc = TypeCostBloc();
  final SelectNameBloc selectNameBloc = SelectNameBloc();
  final SelectDateBloc selectDateBloc = SelectDateBloc();
  final TypePeriodTimeBloc typePeriodTimeBloc = TypePeriodTimeBloc();
  final TakeNoteBloc takeNoteBloc = TakeNoteBloc();

  final TransactionRepositoryImpl _transactionRepositoryImpl =
      TransactionRepositoryImpl();

  void createTransaction() async {
    Transaction _transaction = Transaction(
      cost: typeCostBloc.typeCostState.cost,
      name: selectNameBloc.selectNameState.name,
      note: takeNoteBloc.takeNoteState.note,
      date: selectDateBloc.selectDateState.date,
      typeTransaction: TypeTransactionConst.TURNOVER,
      typePartTransaction: TypePartTransactionConst.FIXED_TRANSACTION,
    );
    print(_transaction.toString());
    await _transactionRepositoryImpl.createTransaction(transaction: _transaction);
  }
}

class TypeCostBloc extends BlocBase {
  TypeCostState typeCostState = TypeCostState(0);

  final remoteTypeCostState = StreamController<TypeCostState>();
  final remoteTypeCostEvent = StreamController<RemoteEvent>();

  TypeCostBloc() {
    remoteTypeCostEvent.stream.listen((RemoteEvent remoteEvent) {
      processCost(remoteEvent);
    });
  }

  void processCost(RemoteEvent remoteEvent) {
    if (remoteEvent is TypeCostEvent) {
      typeCostState = TypeCostState(remoteEvent.cost);
    }
    remoteTypeCostState.sink.add(typeCostState);
  }

  @override
  void dispose() {
    remoteTypeCostState.close();
    remoteTypeCostEvent.close();
  }
}

class SelectNameBloc extends BlocBase {
  SelectNameState selectNameState = SelectNameState('TRANSACTION');

  final remoteSelectNameState = StreamController<SelectNameState>.broadcast();
  final remoteSelectNameEvent = StreamController<RemoteEvent>();

  SelectNameBloc() {
    remoteSelectNameEvent.stream.listen((RemoteEvent remoteEvent) {
      processName(remoteEvent);
    });
  }

  void processName(RemoteEvent remoteEvent) {
    if (remoteEvent is SelectNameEvent) {
      selectNameState = SelectNameState(remoteEvent.name);
    }
    remoteSelectNameState.sink.add(selectNameState);
  }

  @override
  void dispose() {

  }
}

class SelectDateBloc extends BlocBase {
  SelectDateTransactionState selectDateState =
  SelectDateTransactionState(FormatDate.formatCurrentDate);
  final remoteSelectDateState = StreamController<SelectDateTransactionState>.broadcast();
  final remoteSelectDateEvent = StreamController<RemoteEvent>();

  SelectDateBloc() {
    remoteSelectDateEvent.stream.listen((RemoteEvent remoteEvent) {
      processDate(remoteEvent);
    });
  }

  void processDate(RemoteEvent remoteEvent) {
    if (remoteEvent is SelectDateTransactionEvent) {
      selectDateState = SelectDateTransactionState(FormatDate.dateToString(remoteEvent.date));
    }
    remoteSelectDateState.sink.add(selectDateState);
  }

  @override
  void dispose() {
    //remoteSelectDateState.close();
    //remoteSelectDateEvent.close();
  }
}

class TypePeriodTimeBloc extends BlocBase {
  TypePeriodTimeState typePeriodTimeState = TypePeriodTimeState();

  final remoteTypePeriodTimeState = StreamController<TypePeriodTimeState>();
  final remoteTypePeriodTimeEvent = StreamController<RemoteEvent>();

  TypePeriodTimeBloc() {
    remoteTypePeriodTimeEvent.stream.listen((RemoteEvent remoteEvent) {
      processPeriodTime(remoteEvent);
    });
  }

  void processPeriodTime(RemoteEvent remoteEvent) {
    if (remoteEvent is TypePeriodTimeEvent) {
      typePeriodTimeState =
          TypePeriodTimeState(periodTime: remoteEvent.periodTime);
    }
    remoteTypePeriodTimeState.sink.add(typePeriodTimeState);
  }

  @override
  void dispose() {
    remoteTypePeriodTimeState.close();
    remoteTypePeriodTimeEvent.close();
  }
}

class TakeNoteBloc extends BlocBase {
  TakeNoteState takeNoteState = TakeNoteState();

  final remoteTakeNoteSTate = StreamController<TakeNoteState>();
  final remoteTakeNoteEvent = StreamController<RemoteEvent>();

  TakeNoteBloc() {
    remoteTakeNoteEvent.stream.listen((RemoteEvent remoteEvent) {
      processNote(remoteEvent);
    });
  }

  void processNote(RemoteEvent remoteEvent) {
    if (remoteEvent is TakeNoteEvent) {
      takeNoteState = TakeNoteState(note: remoteEvent.note);
    }
    remoteTakeNoteSTate.sink.add(takeNoteState);
  }

  @override
  void dispose() {
    remoteTakeNoteSTate.close();
    remoteTakeNoteEvent.close();
  }
}
