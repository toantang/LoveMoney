import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/util/extensions/tree_view.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/views/config_data.dart';
import '../../../../../core/helper/navigation_screen.dart';
import '../../../../../core/util/extensions/tree_view.dart';

class SelectNameTransaction extends StatelessWidget {
  const SelectNameTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreenWithBack(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DynamicTreeView(
              listData: ConfigData.configData.getData(),
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

