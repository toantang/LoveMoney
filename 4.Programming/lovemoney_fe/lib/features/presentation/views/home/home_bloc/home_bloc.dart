import 'dart:async';

import 'package:lovemoney_fe/core/constant/string_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/formatDate.dart';
import 'package:lovemoney_fe/core/helper/remote_event.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/transaction_repository_impl.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction_part.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/home/home_bloc/home_event.dart';
import 'package:lovemoney_fe/features/presentation/views/home/home_bloc/home_state.dart';

import '../../../../domain/entities/transaction/transaction.dart';

class HomeBloc {
  final SelectTransactionTypeBloc selectTransactionTypeBloc =
      SelectTransactionTypeBloc();
  final SelectStartDateBloc selectStartDateBloc = SelectStartDateBloc();
  final SelectEndDateBloc selectEndDateBloc = SelectEndDateBloc();
  final BuildListTransactionBloc buildListTransactionBloc =
      BuildListTransactionBloc();

  Transaction getTransaction() {
    String type = selectTransactionTypeBloc
        .selectedTransactionTypeState.selectedTransactionType;
    Transaction transaction = Transaction(
      typeTransaction: TransactionConst.getTransactionType(type),
      transactionPart: TransactionPart.getDefaultTransactionPart(
        TransactionConst.getTypeTransactionPart(type),
      ),
      date: selectStartDateBloc.selectStartDateState.date,
      user: AuthBloc.getInstance().user,
    );
    return transaction;
  }
}

class SelectTransactionTypeBloc extends BlocBase {
  SelectTransactionTypeState selectedTransactionTypeState =
      SelectTransactionTypeState(TransactionConst.FIXED_EXPENSE);

  final remoteSelectTransactionTypeEvent = StreamController<RemoteEvent>();
  final remoteSelectTransactionTypeState =
      StreamController<SelectTransactionTypeState>.broadcast();

  SelectTransactionTypeBloc() {
    remoteSelectTransactionTypeEvent.stream.listen((RemoteEvent remoteEvent) {
      processSelectedTransactionType(remoteEvent);
    });
  }

  void processSelectedTransactionType(RemoteEvent remoteEvent) {
    if (remoteEvent is SelectTransactionTypeEvent) {
      selectedTransactionTypeState =
          SelectTransactionTypeState(remoteEvent.selectedTransactionType);
    }

    remoteSelectTransactionTypeState.sink.add(selectedTransactionTypeState);
  }

  @override
  void dispose() {}
}

class SelectStartDateBloc extends BlocBase {
  SelectStartDateState selectStartDateState =
      SelectStartDateState(FormatDate.currentDate);

  final remoteSelectStartDateState =
      StreamController<SelectStartDateState>.broadcast();
  final remoteSelectStartDateEvent = StreamController<RemoteEvent>();

  SelectStartDateBloc() {
    remoteSelectStartDateEvent.stream.listen((RemoteEvent remoteEvent) {
      processStartDate(remoteEvent);
    });
  }

  void processStartDate(RemoteEvent remoteEvent) {
    if (remoteEvent is SelectStartDateEvent) {
      selectStartDateState =
          SelectStartDateState(remoteEvent.date);
    }
    remoteSelectStartDateState.sink.add(selectStartDateState);
  }

  @override
  void dispose() {}
}

class SelectEndDateBloc extends BlocBase {
  SelectEndDateState selectEndDateState =
      SelectEndDateState(FormatDate.currentDate);
  final remoteSelectEndDateState =
      StreamController<SelectEndDateState>.broadcast();
  final remoteSelectEndDateEvent = StreamController<RemoteEvent>();

  SelectEndDateBloc() {
    remoteSelectEndDateEvent.stream.listen((RemoteEvent remoteEvent) {
      processEndDate(remoteEvent);
    });
  }

  void processEndDate(RemoteEvent remoteEvent) {
    if (remoteEvent is SelectEndDateEvent) {
      selectEndDateState =
          SelectEndDateState(remoteEvent.date);
    }
    remoteSelectEndDateState.sink.add(selectEndDateState);
  }

  @override
  void dispose() {}
}

class BuildListTransactionBloc extends BlocBase {
  BuildListTransactionState buildListTransactionState =
      BuildListTransactionState([]);
  final TransactionRepositoryImpl _transactionRepositoryImpl =
      TransactionRepositoryImpl();

  final remoteBuildTransactionState =
      StreamController<BuildListTransactionState>.broadcast();
  final remoteBuildTransactionEvent = StreamController<RemoteEvent>();

  BuildListTransactionBloc() {
    remoteBuildTransactionEvent.stream.listen((RemoteEvent remoteEvent) {
      processListTransaction(remoteEvent);
    });
  }

  Future<void> processListTransaction(RemoteEvent remoteEvent) async {
    if (remoteEvent is BuildListTransactionEvent) {
      Transaction transaction = remoteEvent.transaction;
      ApiResponse<List<Transaction>>? listTransactionApi =
          await _transactionRepositoryImpl.getListTransaction(
        transaction: transaction,
        endDate: remoteEvent.endDate,
      );
      List<Transaction>? listTransaction = listTransactionApi?.result?.data;
      if (listTransaction != null) {
        buildListTransactionState = BuildListTransactionState(listTransaction);
      }
    }
    remoteBuildTransactionState.sink.add(buildListTransactionState);
  }

  @override
  void dispose() {}
}
