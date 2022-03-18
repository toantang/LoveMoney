import 'package:flutter/material.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/dialog_lv.dart';
import '../../../../../core/enum/enum_const.dart';
import '../../../common_widget/list_tile_lv.dart';
import '../../../common_widget/text_lv.dart';
import '../../transaction/information_transaction.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TextLv(
              keyUsedWord: KeyUsedWord.ACCOUNT_BALANCE,
              textStyle: TextStyle(fontSize: 30),
            ),
            DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            const Text('date time'),
            Expanded(
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
            )),
          ],
        ),
      ),
    );
  }
}
