abstract class StringConst {

}

class TypeTransactionConst extends StringConst {
  static const String EXPENSE = 'Expense';
  static const String TURNOVER = 'Turnover';
}

class TypeTransactionPartConst extends StringConst {
  static const String FIXED_TRANSACTION = 'Fixed';
  static const String VARIABLE_TRANSACTION = 'Variable';
}

class TransactionConst extends StringConst {
  static const String VARIABLE_EXPENSE = TypeTransactionPartConst.VARIABLE_TRANSACTION + ' ' + TypeTransactionConst.EXPENSE;
  static const String FIXED_EXPENSE = TypeTransactionPartConst.FIXED_TRANSACTION + ' ' + TypeTransactionConst.EXPENSE;
  static const String VARIABLE_TURNOVER = TypeTransactionPartConst.VARIABLE_TRANSACTION + ' ' + TypeTransactionConst.TURNOVER;
  static const String FIXED_TURNOVER = TypeTransactionPartConst.FIXED_TRANSACTION + ' ' + TypeTransactionConst.TURNOVER;
  static const List<String> LIST_TRANSACTION_TYPE = [VARIABLE_EXPENSE, FIXED_EXPENSE, VARIABLE_TURNOVER, FIXED_TURNOVER, ];

  static String getTransactionType(String type) {
    List<String> list = type.split(' ');
    return list[1];
  }
  static String getTypeTransactionPart(String type) {
    List<String> list = type.split(' ');
    return list[0];
  }
}

class NameTransactionConst extends StringConst {
  static const String EAT_COFFEE = 'Eat&Coffe', EAT = 'Eat', COFFEE = 'Coffee';
  static const String FRIEND_GIRLS = 'Friends & Girls', FRIEND = 'Friend', GIRLS = 'Girls';
  static const String GIFT_DONATE = 'Gift & Donate', GIFT = 'Gift', DONATE = 'Donate';
  static const String HEALTH = 'Health', EXAMINATION = 'Examination', INSURANCE = 'Insurance', MEDICINE = 'Medicine', SPORT = 'Sport';
  static const String HOLIDAY = 'Holiday', WEDDING = 'Wedding', TET_HOLIDAY = 'Tet holiday', ANNIVERSARY = 'Anniversary';
  static const String RELAX = 'Relax', FILMS = 'Films', GAMES = 'Games';
  static const String SHOPPING = 'Shopping', CLOTHES = 'Clothes', ELECTRONICS = 'Electronics', SHOES = 'Shoes';
  static const String VEHICLE = 'Vehicle', PETROL = 'petrol', TAXI = 'Grab/Uber/Gojek', MAINTAIN = 'Maintain';
}

class IdTypeTransaction extends StringConst {
  static const ID_VARIABLE_EXPENSE = '1';
  static const ID_FIXED_EXPENSE = '2';
  static const ID_VARIABLE_TURNOVER = '3';
  static const ID_FIXED_TURNOVER = '4';
}