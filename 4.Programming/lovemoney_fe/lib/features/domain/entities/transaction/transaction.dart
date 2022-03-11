class Transaction {
  final String? name;
  final double? cost;
  final String? type;
  final String? typeTransaction;
  final String? note;

  Transaction(
      {this.name, this.cost, this.type, this.typeTransaction, this.note});

  Transaction copyWith(
      {String? name,
      double? cost,
      String? type,
      String? typeTransaction,
      String? note}) {
    return Transaction(
      name: name ?? name,
      cost: cost ?? cost,
      type: type ?? type,
      typeTransaction: typeTransaction ?? typeTransaction,
      note: note ?? note,
    );
  }
}


