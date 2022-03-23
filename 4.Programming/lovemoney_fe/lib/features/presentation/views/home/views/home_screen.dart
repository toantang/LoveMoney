import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/helper/formatDate.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/date_time_picker_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/dialog_lv.dart';
import '../../../../../core/enum/enum_const.dart';
import '../../../../../core/helper/navigation_screen.dart';
import '../../../common_widget/list_tile_lv.dart';
import '../../../common_widget/text_lv.dart';
import '../../transaction/views/information_transaction.dart';

class HomeScreen extends StatelessWidget {
  final List<String> listTransaction = [
    'transaction1',
    'transaction2',
    'transaction3',
    'transaction4fadsgfghfhg'
        'transaction1',
    'transaction2',
    'transaction3',
    'transaction4fadsgfghfhg'
        'transaction1',
    'transaction2',
    'transaction3',
    'transaction4fadsgfghfhg'
        'transaction1',
    'transaction2',
    'transaction3',
    'transaction4fadsgfghfhg'
  ];

  HomeScreen({Key? key}) : super(key: key);

  Widget _buildAccountBalance() {
    return const TextLv(
      keyUsedWord: KeyUsedWord.ACCOUNT_BALANCE,
      textStyle: TextStyle(fontSize: 30),
    );
  }

  Widget _buildSelectTypeTransaction(BuildContext context) {
    return DropdownButton<String>(
      items: <String>['A', 'B', 'C', 'D'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }

  Widget _buildSelectDate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: Text(FormatDate.formatCurrentDate),
          onPressed: () {
            Nav.pushTo(context, const NavDateTimePicker());
          },
        ),
        const Center(
          child: Text(' - '),
        ),
        TextButton(
          child: Text(FormatDate.formatCurrentDate),
          onPressed: () {
            Nav.pushTo(context, const NavDateTimePicker());
          },
        ),
      ],
    );
  }

  Widget _buildListTransaction() {
    return Expanded(
        child: ListView.builder(
          itemCount: listTransaction.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTileLv(
                onTap: () {
                  //Nav.to(context, ScreenPath.INFO_TRANSACTION);
                  NavDialog.show(context, InformationTransaction());
                },
                title: Center(
                  child: Text(listTransaction[index]),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {

                  },
                ),
              ),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAccountBalance(),
            _buildSelectTypeTransaction(context),
            _buildSelectDate(context),
            _buildListTransaction(),
          ],
        ),
      ),
    );
  }
}
