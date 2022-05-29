import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/error_const.dart';
import 'package:lovemoney_fe/core/constant/string_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/error_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/transaction_bloc/transaction_bloc.dart';
import '../../../../../core/error/custom_error.dart';
import '../../../../../core/util/formatDate.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/date_time_picker_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/dialog_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/home/home_bloc/home_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/home/home_bloc/home_event.dart';
import 'package:lovemoney_fe/features/presentation/views/home/home_bloc/home_state.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/update_transaction_bloc/update_transaction_bloc.dart';
import '../../../../../core/enum/enum_const.dart';
import '../../../../../core/helper/navigation_screen.dart';
import '../../../common_widget/base_screen.dart';
import '../../../common_widget/list_tile_lv.dart';
import '../../../common_widget/text_lv.dart';
import '../../transaction/views/information_transaction.dart';

class HomeScreen extends StatelessWidget {
  late HomeBloc homeBloc;

  final TransactionBloc transactionBloc = TransactionBloc();

  HomeScreen({Key? key}) : super(key: key);

  Widget _buildButton() {
    return ButtonLv(
      keyUsedWord: KeyUsedWord.OK,
      onPressed: () {
        homeBloc.buildListTransactionBloc.remoteBuildTransactionEvent.sink.add(
          BuildListTransactionEvent(
            homeBloc.getTransaction(),
            homeBloc.selectEndDateBloc.selectEndDateState.endDate,
          ),
        );
      },
    );
  }

  Widget _buildAccountBalance() {
    return const TextLv(
      keyUsedWord: KeyUsedWord.ACCOUNT_BALANCE,
      textStyle: TextStyle(fontSize: 30),
    );
  }

  Widget _buildSelectTransactionType(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: BlocProvider(
            child: StreamBuilder<SelectTransactionTypeState>(
              initialData: homeBloc
                  .selectTransactionTypeBloc.selectedTransactionTypeState,
              stream: homeBloc.selectTransactionTypeBloc
                  .remoteSelectTransactionTypeState.stream,
              builder: (context,
                  AsyncSnapshot<SelectTransactionTypeState> snapshot) {
                List<String> items = TransactionConst.LIST_TRANSACTION_TYPE;
                return DropdownButton<String>(
                  value: snapshot.data!.selectedTransactionType,
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? val) {
                    if (val != null) {
                      homeBloc.selectTransactionTypeBloc
                          .remoteSelectTransactionTypeEvent.sink
                          .add(SelectTransactionTypeEvent(val));
                    }
                  },
                );
              },
            ),
            bloc: homeBloc.selectTransactionTypeBloc,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: _buildButton(),
        ),
      ],
    );
  }

  Widget _buildSelectDate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocProvider(
          child: TextButton(
            child: StreamBuilder<SelectStartDateState>(
              initialData: homeBloc.selectStartDateBloc.selectStartDateState,
              stream: homeBloc
                  .selectStartDateBloc.remoteSelectStartDateState.stream,
              builder: (context, snapshot) {
                return Text(FormatDate.dateToString(snapshot.data!.date));
              },
            ),
            onPressed: () async {
              final date = await Nav.pushTo(
                context,
                NavDateTimePicker(
                  limitedDateTime:
                      homeBloc.selectEndDateBloc.selectEndDateState.endDate,
                ),
              );
              String value = FormatDate.dateToString(date as DateTime);
              homeBloc.selectStartDateBloc.remoteSelectStartDateEvent.sink
                  .add(SelectStartDateEvent(FormatDate.stringToDate(value)));
            },
          ),
          bloc: homeBloc.selectStartDateBloc,
        ),
        const Center(
          child: Text(' - '),
        ),
        BlocProvider(
          child: TextButton(
            child: StreamBuilder<SelectEndDateState>(
              initialData: homeBloc.selectEndDateBloc.selectEndDateState,
              stream:
                  homeBloc.selectEndDateBloc.remoteSelectEndDateState.stream,
              builder: (context, snapshot) {
                return Text(FormatDate.dateToString(snapshot.data!.endDate));
              },
            ),
            onPressed: () async {
              print(homeBloc.selectStartDateBloc.selectStartDateState.date);
              final date = await Nav.pushTo(
                context,
                NavDateTimePicker(
                  lowerDateTime:
                      homeBloc.selectStartDateBloc.selectStartDateState.date,
                ),
              );
              String value = FormatDate.dateToString(date as DateTime);
              homeBloc.selectEndDateBloc.remoteSelectEndDateEvent.sink
                  .add(SelectEndDateEvent(FormatDate.stringToDate(value)));
            },
          ),
          bloc: homeBloc.selectEndDateBloc,
        ),
      ],
    );
  }

  void _deleteTransactionButton(BuildContext context, {required Transaction transaction}) async {
    CustomError customError = await transactionBloc.deleteTransaction(
        transaction: transaction);
    if (CustomError.validateCodeError(customError)) {
      homeBloc.buildListTransactionBloc.remoteBuildTransactionEvent.sink
          .add(BuildListTransactionEvent(
        homeBloc.getTransaction(),
        homeBloc.selectEndDateBloc.selectEndDateState.endDate,
      ));
    }
    Nav.back(context);
    NavSnackBar.displayError(context, customError: customError);
  }

  Widget _buildOneItemTransaction(
      BuildContext context, Transaction transaction) {
    return Card(
      child: ListTileLv(
        onTap: () {
          NavDialog.show(
            context,
            InformationTransaction(
              updateTransactionBloc: UpdateTransactionBloc(
                transaction: transaction,
              ),
            ),
          );
        },
        title: Center(
          child: Text(transaction.name!),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            NavDialog.show(context, OptionsAlertDialogLv(
              onPressYes: () {
                _deleteTransactionButton(context, transaction: transaction);
              },
            ),);
          },
        ),
      ),
    );
  }

  Widget _buildListTransaction() {
    return Expanded(
      child: BlocProvider(
        child: StreamBuilder<BuildListTransactionState>(
          initialData:
              homeBloc.buildListTransactionBloc.buildListTransactionState,
          stream: homeBloc
              .buildListTransactionBloc.remoteBuildTransactionState.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Transaction> transactions = snapshot.data!.transactions;
              return ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return _buildOneItemTransaction(context, transactions[index]);
                },
              );
            } else {
              return const Text(ErrorConst.NULL_STREAM);
            }
          },
        ),
        bloc: homeBloc.buildListTransactionBloc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    homeBloc = BlocProvider.of(context)!;

    return BaseScreen(
      body: SafeArea(
        child: Column(
          children: [
            _buildAccountBalance(),
            _buildSelectTransactionType(context),
            _buildSelectDate(context),
            _buildListTransaction(),
          ],
        ),
      ),
    );
  }
}
