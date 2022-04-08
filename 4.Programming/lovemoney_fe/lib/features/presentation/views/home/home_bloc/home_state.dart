import '../../../../domain/entities/transaction/transaction.dart';

class SelectStartDateState {
  final DateTime date;
  SelectStartDateState(this.date);
}
class SelectEndDateState {
  final DateTime endDate;
  SelectEndDateState(this.endDate);
}
class SelectTransactionTypeState {
  final String selectedTransactionType;
  SelectTransactionTypeState(this.selectedTransactionType);
}

class BuildListTransactionState {
  final List<Transaction> transactions;
  BuildListTransactionState(this.transactions);
}