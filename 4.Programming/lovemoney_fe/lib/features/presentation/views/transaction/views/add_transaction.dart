import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';
import 'package:lovemoney_fe/core/constant/size_const.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/formatDate.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/date_time_picker_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/list_tile_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_field_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/add_transaction_bloc/add_transaction_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/add_transaction_bloc/add_transaction_state.dart';
import 'package:lovemoney_fe/core/helper/navigation_screen.dart';
import '../../../../../core/util/extensions/tree_view.dart';
import '../select_name_transaction/select_name_transaction.dart';

import '../../../../../core/helper/format_text_to_number.dart';
import '../add_transaction_bloc/add_transaction_event.dart';

class AddTransaction extends StatelessWidget {
  final TextEditingController ecControllerCost = TextEditingController();
  final TextEditingController ecControllerPeriodTime = TextEditingController();
  final TextEditingController ecControllerNote = TextEditingController();

  final AddTransactionBloc addTransactionBloc = AddTransactionBloc();

  AddTransaction({Key? key}) : super(key: key);

  Widget _inputCost() {
    return TextFieldLv(
      textEditingController: ecControllerCost,
      keyUsedWord: KeyUsedWord.COST,
      textInputType: const TextInputType.numberWithOptions(
        signed: true,
      ),
      maxLength: 15,
    );
  }

  Widget _inputNameTransaction(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Card(
        color: ColorConst.primaryColorConst.greenShade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: BlocProvider(
          bloc: addTransactionBloc.selectNameBloc,
          child: StreamBuilder<SelectNameState>(
              initialData: addTransactionBloc.selectNameBloc.selectNameState,
              stream: addTransactionBloc.selectNameBloc.remoteSelectNameState.stream,
              builder: (context, AsyncSnapshot<SelectNameState> snapshot) {
                return ListTileLv(
                  onTap: () async {
                    final baseData = await Nav.pushTo(context, const SelectNameTransaction());
                    if (baseData is BaseData) {
                      print(baseData.name);
                      addTransactionBloc.selectNameBloc.remoteSelectNameEvent.sink.add(SelectNameEvent(baseData.name));
                    }
                  },
                  title: Center(
                    child: Text(snapshot.data!.name, style: const TextStyle(fontSize: SizeConst.sizeTextButton),),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    size: SizeConst.sizeIconButton,
                  ),
                );
              }
          ),
        ),
      ),
    );
  }

  Widget _inputDateAndPeriodTime(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Card(
              child: BlocProvider(
                bloc: addTransactionBloc.selectDateBloc,
                child: StreamBuilder<SelectDateTransactionState>(
                  initialData:
                      addTransactionBloc.selectDateBloc.selectDateState,
                  stream: addTransactionBloc
                      .selectDateBloc.remoteSelectDateState.stream,
                  builder: (context,
                      AsyncSnapshot<SelectDateTransactionState> snapshot) {
                    return ListTileLv(
                      onTap: () async {
                        final date = await Nav.pushTo(
                            context, const NavDateTimePicker());
                        String value =
                            FormatDate.dateToString(date as DateTime);
                        addTransactionBloc
                            .selectDateBloc.remoteSelectDateEvent.sink
                            .add(SelectDateTransactionEvent(
                                FormatDate.stringToDate(value)));
                      },
                      leading: Text(snapshot.data!.date),
                      trailing: const Icon(
                        Icons.date_range,
                        size: SizeConst.sizeIconButton,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: TextFieldLv(
              keyUsedWord: KeyUsedWord.PERIOD_TIME,
              textEditingController: ecControllerPeriodTime,
              maxLength: 2,
              enabled: false,
              textInputType: const TextInputType.numberWithOptions(
                signed: true,
                decimal: false,
              ),
              countText: '',
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputNote() {
    return SizedBox(
      child: TextFieldLv(
        textEditingController: ecControllerNote,
        keyUsedWord: KeyUsedWord.NOTE,
        maxLines: 4,
        maxLength: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                child: _inputCost(),
                padding: const EdgeInsets.only(top: 26),
              ),
              Padding(
                child: _inputNameTransaction(context),
                padding: const EdgeInsets.only(top: 16),
              ),
              Padding(
                child: _inputDateAndPeriodTime(context),
                padding: const EdgeInsets.only(top: 16),
              ),
              Padding(
                child: _inputNote(),
                padding: const EdgeInsets.only(top: 16),
              ),
              Padding(
                child: ButtonLv(
                  onPressed: () {
                    addTransactionBloc.typeCostBloc.typeCostState =
                        TypeCostState(
                            FormatTextToNumber.formatTextToDouble(
                                ecControllerCost.text));
                    addTransactionBloc.takeNoteBloc.takeNoteState =
                        TakeNoteState(note: ecControllerNote.text);
                    addTransactionBloc.typePeriodTimeBloc
                        .typePeriodTimeState = TypePeriodTimeState(
                      periodTime: ecControllerPeriodTime.text == ''
                          ? 999999
                          : double.parse(ecControllerPeriodTime.text),
                    );
                    addTransactionBloc.createTransaction();
                  },
                  keyUsedWord: KeyUsedWord.ADD,
                  textStyle: const TextStyle(
                    fontSize: SizeConst.sizeTextButton,
                  ),
                ),
                padding: const EdgeInsets.only(top: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
