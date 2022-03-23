import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/util/extensions/tree_view.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/views/config_data.dart';
import '../../../../../core/helper/navigation_screen.dart';
import '../../../../../core/util/extensions/tree_view.dart';

class SelectNameTransaction extends StatelessWidget {
  const SelectNameTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DynamicTreeView(
              listData: ConfigData.configData(),
              width: MediaQuery.of(context).size.width,
              onTap: (map) {
                Nav.back(context, BaseData.toBaseData(map));
              },
            ),
          ],
        ),
      ),
    );
  }
}

