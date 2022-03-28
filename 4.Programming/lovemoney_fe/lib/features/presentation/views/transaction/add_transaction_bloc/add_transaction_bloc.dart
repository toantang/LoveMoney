import 'dart:async';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/formatDate.dart';
import 'package:lovemoney_fe/core/helper/manager_bloc.dart';
import 'package:lovemoney_fe/core/helper/remote_event.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/transaction_repository_impl.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/fixed_transaction.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction_part.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/variable_transaction.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/add_transaction_bloc/add_transaction_event.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/add_transaction_bloc/add_transaction_state.dart';

import '../../../../../core/constant/string_const.dart';

class AddTransactionBloc extends ManagerBloc {
  String? baseDataId;

  final TypeCostBloc typeCostBloc = TypeCostBloc();
  final SelectNameBloc selectNameBloc = SelectNameBloc();
  final SelectDateBloc selectDateBloc = SelectDateBloc();
  final TypePeriodTimeBloc typePeriodTimeBloc = TypePeriodTimeBloc();
  final TakeNoteBloc takeNoteBloc = TakeNoteBloc();

  final TransactionRepositoryImpl _transactionRepositoryImpl =
      TransactionRepositoryImpl();

  void createTransaction() async {
    TransactionPart? _transactionPart = TransactionPart();
    String typePartTransaction =
        _transactionPart.getTransactionPartByBaseId(baseDataId);

    Transaction _transaction = Transaction(
        cost: typeCostBloc.typeCostState.cost,
        name: selectNameBloc.selectNameState.name,
        note: takeNoteBloc.takeNoteState.note,
        date: selectDateBloc.selectDateState.date,
        typeTransaction: TypeTransactionConst.TURNOVER,
        user: AuthBloc.getInstance().user,
        transactionPart: TransactionPart(
          typeTransactionPart: typePartTransaction,
          fixedTransaction: FixedTransaction(
              periodTime: typePeriodTimeBloc.typePeriodTimeState.periodTime),
          variableTransaction: VariableTransaction(),
        ));

    print(_transaction.toString());
    ApiResponse<Transaction>? apiResponse = await _transactionRepositoryImpl
        .createTransaction(transaction: _transaction);
    Transaction? transaction = apiResponse?.result?.data;
    print(transaction.toString());
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

  bool checkSelectedName(String inputName) {
    if (inputName == 'TRANSACTION') {
      return false;
    }
    return true;
  }

  void processName(RemoteEvent remoteEvent) {
    if (remoteEvent is SelectNameEvent) {
      if (checkSelectedName(remoteEvent.name)) {
        selectNameState = SelectNameState(remoteEvent.name);
      }
    }
    remoteSelectNameState.sink.add(selectNameState);
  }

  @override
  void dispose() {}
}

class SelectDateBloc extends BlocBase {
  SelectDateTransactionState selectDateState =
      SelectDateTransactionState(FormatDate.formatCurrentDate);
  final remoteSelectDateState =
      StreamController<SelectDateTransactionState>.broadcast();
  final remoteSelectDateEvent = StreamController<RemoteEvent>();

  SelectDateBloc() {
    remoteSelectDateEvent.stream.listen((RemoteEvent remoteEvent) {
      processDate(remoteEvent);
    });
  }

  void processDate(RemoteEvent remoteEvent) {
    if (remoteEvent is SelectDateTransactionEvent) {
      selectDateState =
          SelectDateTransactionState(FormatDate.dateToString(remoteEvent.date));
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
  TextFieldPeriodTimeState textFieldPeriodTimeState =
      TextFieldPeriodTimeState(false);

  final remoteTypePeriodTimeState = StreamController<TypePeriodTimeState>();
  final remoteTypePeriodTimeEvent = StreamController<RemoteEvent>();

  final remoteTextFieldPeriodTimeState =
      StreamController<TextFieldPeriodTimeState>.broadcast();
  final remoteTextFieldPeriodTimeEvent = StreamController<RemoteEvent>();

  TypePeriodTimeBloc() {
    remoteTypePeriodTimeEvent.stream.listen((RemoteEvent remoteEvent) {
      processPeriodTime(remoteEvent);
    });
  }

  String getTypePartTransaction(String id) {
    if (id[0] == IdTypeTransaction.ID_FIXED_TURNOVER ||
        id[0] == IdTypeTransaction.ID_FIXED_EXPENSE) {
      return TypeTransactionPartConst.FIXED_TRANSACTION;
    }
    return TypeTransactionPartConst.VARIABLE_TRANSACTION;
  }

  bool checkVariableTransaction(String id) {
    if (id[0] == IdTypeTransaction.ID_VARIABLE_EXPENSE ||
        id[0] == IdTypeTransaction.ID_VARIABLE_TURNOVER) {
      return true;
    }
    return false;
  }

  void processPeriodTime(RemoteEvent remoteEvent) {
    if (remoteEvent is TypePeriodTimeEvent) {
      if (remoteEvent.periodTime != null) {
        typePeriodTimeState =
            TypePeriodTimeState(periodTime: remoteEvent.periodTime);
      }
    } else if (remoteEvent is TextFieldPeriodTimeEvent) {
      if (checkVariableTransaction(remoteEvent.idTypeTransaction)) {
        textFieldPeriodTimeState = TextFieldPeriodTimeState(false);
      } else {
        textFieldPeriodTimeState = TextFieldPeriodTimeState(true);
      }
    }
    remoteTextFieldPeriodTimeState.sink.add(textFieldPeriodTimeState);
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
