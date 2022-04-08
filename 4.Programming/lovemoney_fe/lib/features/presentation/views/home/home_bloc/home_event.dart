import '../../../../../core/helper/remote_event.dart';
import '../../../../domain/entities/transaction/transaction.dart';

class SelectStartDateEvent extends RemoteEvent {
  final DateTime date;
  SelectStartDateEvent(this.date);
}
class SelectEndDateEvent extends RemoteEvent {
  final DateTime date;
  SelectEndDateEvent(this.date);
}

class SelectTransactionTypeEvent extends RemoteEvent {
  final String selectedTransactionType;
  SelectTransactionTypeEvent(this.selectedTransactionType);
}

class BuildListTransactionEvent extends RemoteEvent {
  final Transaction transaction;
  final DateTime endDate;
  BuildListTransactionEvent(this.transaction, this.endDate);
}