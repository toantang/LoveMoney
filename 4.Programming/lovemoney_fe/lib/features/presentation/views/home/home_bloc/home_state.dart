import '../../../../domain/entities/transaction/transaction.dart';

class SelectStartDateState {
  final String date;
  SelectStartDateState(this.date);
}
class SelectEndDateState {
  final String date;
  SelectEndDateState(this.date);
}
class SelectTransactionTypeState {
  final String selectedTransactionType;
  SelectTransactionTypeState(this.selectedTransactionType);
}

class BuildListTransactionState {
  final List<Transaction> transactions;
  BuildListTransactionState(this.transactions);
}