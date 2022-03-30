import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/date_time_picker_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/dialog_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/update_transaction_bloc/update_transaction_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/update_transaction_bloc/update_transaction_event.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/update_transaction_bloc/update_transaction_state.dart';

import '../../../../../core/enum/enum_const.dart';
import '../../../../../core/helper/navigation_screen.dart';
import '../../../../domain/entities/transaction/transaction.dart';
import '../../../common_widget/list_tile_lv.dart';
import '../../../common_widget/text_lv.dart';

class InformationTransaction extends StatelessWidget {
  final UpdateTransactionBloc updateTransactionBloc;

  const InformationTransaction({
    Key? key,
    required this.updateTransactionBloc,
  }) : super(key: key);

  Widget _buildLine(
    BuildContext context,
    KeyUsedWord keyUsedWord,
    String content, {
    VoidCallback? onPressed,
  }) {
    return ListTileLv(
      leading: TextLv(keyUsedWord: keyUsedWord),
      title: Text(
        content,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.edit,
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget _infoCost(BuildContext context) {
    return BlocProvider(
      bloc: updateTransactionBloc.updateCostBloc,
      child: StreamBuilder<UpdateCostState>(
        initialData: updateTransactionBloc.updateCostBloc.updateCostState,
        stream: updateTransactionBloc.updateCostBloc.remoteUpdateCostState.stream,
        builder: (context, snapshot) {
          return _buildLine(
            context,
            KeyUsedWord.COST,
            snapshot.data!.newCost.toString(),
            onPressed: () async {
              final newCost = await Nav.pushTo(
                context,
                AlertDialogLvUpdate(
                  keyUsedWord: KeyUsedWord.COST,
                  contentTextField: snapshot.data!.newCost.toString(),
                ),
              );
              updateTransactionBloc.updateCostBloc.remoteUpdateCostEvent.sink
                  .add(UpdateCostEvent(double.parse(newCost.toString())));
            },
          );
        },
      ),
    );
  }

  Widget _infoDate(BuildContext context) {
    return BlocProvider(
        child: StreamBuilder<UpdateDateState>(
          initialData: updateTransactionBloc.updateDateBloc.updateDateState,
          stream:
              updateTransactionBloc.updateDateBloc.remoteUpdateDateState.stream,
          builder: (context, snapshot) {
            return _buildLine(
              context,
              KeyUsedWord.DATE,
              snapshot.data!.newDate.toString(),
              onPressed: () async {
                final newDate = await Nav.pushTo(
                    context, const NavDateTimePicker());
                updateTransactionBloc.updateDateBloc.remoteUpdateDateEvent.sink
                    .add(UpdateDateEvent(newDate as DateTime));
              },
            );
          },
        ),
        bloc: updateTransactionBloc.updateDateBloc,);
  }

  Widget _infoNote(BuildContext context) {
    return BlocProvider(
        child: StreamBuilder<UpdateNoteState>(
          initialData: updateTransactionBloc.updateNoteBloc.updateNoteState,
          stream: updateTransactionBloc.updateNoteBloc.remoteUpdateNoteState.stream,
          builder: (context, AsyncSnapshot<UpdateNoteState> snapshot) {
            return _buildLine(
              context,
              KeyUsedWord.NOTE,
              snapshot.data!.newNote,
              onPressed: () async {
                final newNote = await Nav.pushTo(
                  context,
                  AlertDialogLvUpdate(
                    keyUsedWord: KeyUsedWord.COST,
                    contentTextField: snapshot.data!.newNote.toString(),
                  ),
                );

                updateTransactionBloc.updateNoteBloc.remoteUpdateNoteEvent.sink
                    .add(UpdateNoteEvent(newNote.toString()));
              },
            );
          },
        ),
        bloc: updateTransactionBloc.updateNoteBloc,);
  }

  bool checkPeriodTime() {
    if (updateTransactionBloc.transaction.transactionPart == null) {
      return false;
    } else {
      if (updateTransactionBloc.transaction.transactionPart!.fixedTransaction ==
          null) {
        return false;
      } else {
        return true;
      }
    }
  }

  Widget _infoPeriodTime(BuildContext context) {
    return _buildLine(
        context,
        KeyUsedWord.PERIOD_TIME,
        updateTransactionBloc
            .transaction.transactionPart!.fixedTransaction!.periodTime!
            .toString(),
        onPressed: () {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialogLv(
      title: Text(updateTransactionBloc.transaction.name!),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _infoCost(context),
          _infoDate(context),
          _infoNote(context),
          checkPeriodTime() ? _infoPeriodTime(context) : Container(),
        ],
      ),
      actions: [
        ButtonLv(
          onPressed: () {
            Nav.back(context);
          },
          keyUsedWord: KeyUsedWord.BACK,
        ),
      ],
    );
  }
}
