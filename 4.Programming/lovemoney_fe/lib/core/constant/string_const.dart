abstract class StringConst {

}

class TypeTransactionConst extends StringConst {
  static const String EXPENSE = 'Expense';
  static const String TURNOVER = 'Turnover';
}

class TypePartTransactionConst extends StringConst {
  static const String FIXED_TRANSACTION = 'Fixed';
  static const String VARIABLE_TRANSACTION = 'Variable';
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