import 'package:lovemoney_fe/core/constant/string_const.dart';

import '../../../../../core/util/extensions/tree_view.dart';

class ConfigData {
  List<String> typeTransactions = [
    TypeTransactionConst.EXPENSE,
    TypeTransactionConst.TURNOVER
  ];

  static List<BaseData> configData() {
    List<BaseData> datas = [];
    BaseData rootBase = BaseData(id: '0', name: 'Root', parentId: '-1',);
    BaseData data = BaseData(id: '', parentId: '', name: '');
    datas = [
      rootBase,
      BaseData(id: '1', parentId: '0', name: TypeTransactionConst.EXPENSE,),
      BaseData(id: '2', parentId: '0', name: TypeTransactionConst.TURNOVER,),
      BaseData(id: '2.1', parentId: '1', name: NameTransactionConst.EAT_COFFEE,),
      BaseData(id: '2.2', parentId: '1', name: NameTransactionConst.FRIEND_GIRLS,),
      BaseData(id: '2.3', parentId: '1', name: NameTransactionConst.GIFT_DONATE,),
      BaseData(id: '2.4', parentId: '1', name: NameTransactionConst.HEALTH,),
      BaseData(id: '2.5', parentId: '1', name: NameTransactionConst.HOLIDAY,),
      BaseData(id: '2.6', parentId: '1', name: NameTransactionConst.RELAX,),
      BaseData(id: '2.7', parentId: '1', name: NameTransactionConst.SHOPPING,),
      BaseData(id: '2.8', parentId: '1', name: NameTransactionConst.VEHICLE,),

      BaseData(id: '2.1.1', parentId: '2.1', name: NameTransactionConst.EAT,),
      BaseData(id: '2.1.2', parentId: '2.1', name: NameTransactionConst.COFFEE,),

      BaseData(id: '2.2.1', parentId: '2.2', name: NameTransactionConst.FRIEND,),
      BaseData(id: '2.2.2', parentId: '2.2', name: NameTransactionConst.GIRLS,),

      BaseData(id: '2.3.1', parentId: '2.3', name: NameTransactionConst.GIFT,),
      BaseData(id: '2.3.2', parentId: '2.3', name: NameTransactionConst.DONATE,),

      BaseData(id: '2.4.1', parentId: '2.4', name: NameTransactionConst.EXAMINATION,),
      BaseData(id: '2.4.2', parentId: '2.4', name: NameTransactionConst.INSURANCE,),
      BaseData(id: '2.4.3', parentId: '2.4', name: NameTransactionConst.MEDICINE,),
      BaseData(id: '2.4.4', parentId: '2.4', name: NameTransactionConst.SPORT,),

      BaseData(id: '2.5.1', parentId: '2.5', name: NameTransactionConst.WEDDING,),
      BaseData(id: '2.5.2', parentId: '2.5', name: NameTransactionConst.TET_HOLIDAY,),
      BaseData(id: '2.5.3', parentId: '2.5', name: NameTransactionConst.ANNIVERSARY,),

      BaseData(id: '2.6.1', parentId: '2.6', name: NameTransactionConst.FILMS,),
      BaseData(id: '2.6.2', parentId: '2.6', name: NameTransactionConst.GAMES,),

      BaseData(id: '2.7.1', parentId: '2.7', name: NameTransactionConst.CLOTHES,),
      BaseData(id: '2.7.2', parentId: '2.7', name: NameTransactionConst.ELECTRONICS,),
      BaseData(id: '2.7.3', parentId: '2.7', name: NameTransactionConst.SHOES,),

      BaseData(id: '2.8.1', parentId: '2.8', name: NameTransactionConst.PETROL,),
      BaseData(id: '2.8.2', parentId: '2.8', name: NameTransactionConst.TAXI,),
      BaseData(id: '2.8.3', parentId: '2.8', name: NameTransactionConst.MAINTAIN,),


    ];
    return datas;
  }

  static List<BaseData> getData() {
    return [
      BaseData(
        id: '1',
        name: 'Root',
        parentId: '-1',
        extra: {'key': 'extradata1'},
      ),
      BaseData(
        id: '2',
        name: 'Men',
        parentId: '1',
        extra: {'key': 'extradata2'},
      ),
      BaseData(
        id: '3',
        name: 'Shorts',
        parentId: '2',
        extra: {'key': 'extradata3'},
      ),
      BaseData(
        id: '4',
        name: 'Shoes',
        parentId: '2',
        extra: {'key': 'extradata4'},
      ),
      BaseData(
        id: '5',
        name: 'Women',
        parentId: '1',
        extra: {'key': 'extradata5'},
      ),
      BaseData(
        id: '6',
        name: 'Shoes',
        parentId: '5',
        extra: {'key': 'extradata6'},
      ),
      BaseData(
        id: '7',
        name: 'Shorts',
        parentId: '5',
        extra: {'key': 'extradata7'},
      ),
      BaseData(
        id: '8',
        name: 'Tops',
        parentId: '5',
        extra: {'key': 'extradata8'},
      ),
      BaseData(
        id: '9',
        name: 'Electronics',
        parentId: '1',
        extra: {'key': 'extradata9'},
      ),
      BaseData(
        id: '10',
        name: 'Phones',
        parentId: '9',
        extra: {'key': 'extradata10'},
      ),
      BaseData(
        id: '11',
        name: 'Tvs',
        parentId: '9',
        extra: {'key': 'extradata11'},
      ),
      BaseData(
        id: '12',
        name: 'Laptops',
        parentId: '9',
        extra: {'key': 'extradata12'},
      ),
      BaseData(
        id: '13',
        name: 'Nike shooes',
        parentId: '4',
        extra: {'key': 'extradata13'},
      ),
      BaseData(
        id: '14',
        name: 'puma shoes',
        parentId: '4',
        extra: {'key': 'extradata14'},
      ),
      BaseData(
        id: '15',
        name: 'puma shoes 1',
        parentId: '14',
        extra: {'key': 'extradata15'},
      ),
      BaseData(
        id: '16',
        name: 'puma shoes 2',
        parentId: '14',
        extra: {'key': 'extradata16'},
      ),
      BaseData(
        id: '17',
        name: 'puma shoes 3',
        parentId: '14',
        extra: {'key': 'extradata17'},
      ),
    ];
  }
/*static List<BaseData> getData() {
    return [
      BaseData(
        id: 1,
        name: 'Root',
        parentId: -1,
        extras: {'key': 'extradata1'},
      ),
      BaseData(
        id: 2,
        name: 'Men',
        parentId: 1,
        extras: {'key': 'extradata2'},
      ),
      BaseData(
        id: 3,
        name: 'Shorts',
        parentId: 2,
        extras: {'key': 'extradata3'},
      ),
      BaseData(
        id: 4,
        name: 'Shoes',
        parentId: 2,
        extras: {'key': 'extradata4'},
      ),
      BaseData(
        id: 5,
        name: 'Women',
        parentId: 1,
        extras: {'key': 'extradata5'},
      ),
      BaseData(
        id: 6,
        name: 'Shoes',
        parentId: 5,
        extras: {'key': 'extradata6'},
      ),
      BaseData(
        id: 7,
        name: 'Shorts',
        parentId: 5,
        extras: {'key': 'extradata7'},
      ),
      BaseData(
        id: 8,
        name: 'Tops',
        parentId: 5,
        extras: {'key': 'extradata8'},
      ),
      BaseData(
        id: 9,
        name: 'Electronics',
        parentId: 1,
        extras: {'key': 'extradata9'},
      ),
      BaseData(
        id: 10,
        name: 'Phones',
        parentId: 9,
        extras: {'key': 'extradata10'},
      ),
      BaseData(
        id: 11,
        name: 'Tvs',
        parentId: 9,
        extras: {'key': 'extradata11'},
      ),
      BaseData(
        id: 12,
        name: 'Laptops',
        parentId: 9,
        extras: {'key': 'extradata12'},
      ),
      BaseData(
        id: 13,
        name: 'Nike shooes',
        parentId: 4,
        extras: {'key': 'extradata13'},
      ),
      BaseData(
        id: 14,
        name: 'puma shoes',
        parentId: 4,
        extras: {'key': 'extradata14'},
      ),
      BaseData(
        id: 15,
        name: 'puma shoes 1',
        parentId: 14,
        extras: {'key': 'extradata15'},
      ),
      BaseData(
        id: 16,
        name: 'puma shoes 2',
        parentId: 14,
        extras: {'key': 'extradata16'},
      ),
      BaseData(
        id: 17,
        name: 'puma shoes 3',
        parentId: 14,
        extras: {'key': 'extradata17'},
      ),
    ];
  }*/
}
