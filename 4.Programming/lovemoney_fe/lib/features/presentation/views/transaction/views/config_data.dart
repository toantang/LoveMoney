import 'package:lovemoney_fe/core/constant/string_const.dart';

import '../../../../../core/util/extensions/tree_view.dart';

class ConfigData {

  static final ConfigData configData = ConfigData();

  List<BaseData> getData() {
    List<BaseData> datas = [];
    BaseData rootBase = BaseData(id: '0', name: 'Root', parentId: '-1',);
    //BaseData data = BaseData(id: '', parentId: '', name: '');
    datas = [rootBase,];
    datas.insertAll(0, _variableExpenseData());
    datas.insertAll(0, _fixedExpenseData());
    datas.insertAll(0, _variableTurnoverData());
    datas.insertAll(0, _fixedTurnoverData());
    return datas;
  }

  List<BaseData> _variableExpenseData() {
    BaseData rootVariableExpenseData = BaseData(id: '1', parentId: '0', name: TransactionConst.VARIABLE_EXPENSE,);
    List<BaseData> datas = [rootVariableExpenseData, ];
    var eatCoffee = [
      BaseData(id: '1.1', parentId: '1', name: NameTransactionConst.EAT_COFFEE,),
      BaseData(id: '1.1.1', parentId: '1.1', name: NameTransactionConst.EAT,),
      BaseData(id: '1.1.2', parentId: '1.1', name: NameTransactionConst.COFFEE,),
    ];
    datas.insertAll(0, eatCoffee);

    var friendGirls = [
      BaseData(id: '1.2', parentId: '1', name: NameTransactionConst.FRIEND_GIRLS,),
      BaseData(id: '1.2.1', parentId: '1.2', name: NameTransactionConst.FRIEND,),
      BaseData(id: '1.2.2', parentId: '1.2', name: NameTransactionConst.GIRLS,),
    ];
    datas.insertAll(0, friendGirls);
    var giftDonate = [
      BaseData(id: '1.3', parentId: '1', name: NameTransactionConst.GIFT_DONATE,),
      BaseData(id: '1.3.1', parentId: '1.3', name: NameTransactionConst.GIFT,),
      BaseData(id: '1.3.2', parentId: '1.3', name: NameTransactionConst.DONATE,),
    ];
    datas.insertAll(0, giftDonate);

    var health = [
      BaseData(id: '1.4', parentId: '1', name: NameTransactionConst.HEALTH,),
      BaseData(id: '14.1', parentId: '1.4', name: NameTransactionConst.EXAMINATION,),
      BaseData(id: '1.4.2', parentId: '1.4', name: NameTransactionConst.INSURANCE,),
      BaseData(id: '1.4.3', parentId: '1.4', name: NameTransactionConst.MEDICINE,),
      BaseData(id: '1.4.4', parentId: '1.4', name: NameTransactionConst.SPORT,),
    ];
    datas.insertAll(0, health);

    var holiday = [
      BaseData(id: '1.5', parentId: '1', name: NameTransactionConst.HOLIDAY,),
      BaseData(id: '1.5.1', parentId: '1.5', name: NameTransactionConst.WEDDING,),
      BaseData(id: '1.5.2', parentId: '1.5', name: NameTransactionConst.TET_HOLIDAY,),
      BaseData(id: '1.5.3', parentId: '1.5', name: NameTransactionConst.ANNIVERSARY,)
    ];
    datas.insertAll(0, holiday);

    var relax = [
      BaseData(id: '1.6', parentId: '1', name: NameTransactionConst.RELAX,),
      BaseData(id: '1.6.1', parentId: '1.6', name: NameTransactionConst.FILMS,),
      BaseData(id: '1.6.2', parentId: '1.6', name: NameTransactionConst.GAMES,),
    ];
    datas.insertAll(0, relax);

    var shopping = [
      BaseData(id: '1.7', parentId: '1', name: NameTransactionConst.SHOPPING,),
      BaseData(id: '1.7.1', parentId: '1.7', name: NameTransactionConst.CLOTHES,),
      BaseData(id: '1.7.2', parentId: '1.7', name: NameTransactionConst.ELECTRONICS,),
      BaseData(id: '1.7.3', parentId: '1.7', name: NameTransactionConst.SHOES,),
    ];
    datas.insertAll(0, shopping);

    var vehicle = [
      BaseData(id: '1.8', parentId: '1', name: NameTransactionConst.VEHICLE,),
      BaseData(id: '1.8.1', parentId: '1.8', name: NameTransactionConst.PETROL,),
      BaseData(id: '1.8.2', parentId: '1.8', name: NameTransactionConst.TAXI,),
      BaseData(id: '1.8.3', parentId: '1.8', name: NameTransactionConst.MAINTAIN,),
    ];
    datas.insertAll(0, vehicle);

    return datas;
  }

  List<BaseData> _fixedExpenseData() {
    BaseData rootFixedExpenseData = BaseData(id: '2', parentId: '0', name: TransactionConst.FIXED_EXPENSE,);
    List<BaseData> datas = [rootFixedExpenseData, ];
    return datas;
  }

  List<BaseData> _variableTurnoverData() {
    BaseData rootFixedTurnoverData = BaseData(id: '3', parentId: '0', name: TransactionConst.VARIABLE_TURNOVER,);
    List<BaseData> datas = [rootFixedTurnoverData, ];
    return datas;
  }

  List<BaseData> _fixedTurnoverData() {
    BaseData rootVariableExpenseData = BaseData(id: '4', parentId: '0', name: TransactionConst.FIXED_TURNOVER,);
    List<BaseData> datas = [rootVariableExpenseData, ];
    return datas;
  }

}
