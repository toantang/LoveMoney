class Transaction {
  final String? _name;
  final double? _cost;
  final String? _type;
  final String? _typeTransaction;
  final String? _note;

  Transaction(
      {String? name,
      double? cost,
      String? type,
      String? typeTransaction,
      String? note})
      : _name = name,
        _cost = cost,
        _type = type,
        _typeTransaction = typeTransaction,
        _note = note;

  Transaction copyWith(
      {String? name,
      double? cost,
      String? type,
      String? typeTransaction,
      String? note}) {
    return Transaction(
      name: name ?? _name,
      cost: cost ?? _cost,
      type: type ?? _type,
      typeTransaction: typeTransaction ?? _typeTransaction,
      note: note ?? _note,
    );
  }
}

class FixedTransaction extends Transaction {
  final double? _periodTime;

  FixedTransaction(
      {String? name,
      double? cost,
      String? type,
      String? typeTransaction,
      String? note,
      double? periodTime})
      : _periodTime = periodTime,
        super(
          name: name,
          cost: cost,
          type: type,
          typeTransaction: typeTransaction,
          note: note,
        );


  @override
  FixedTransaction copyWith({String? name,
      double? cost,
      String? type,
      String? typeTransaction,
      String? note,
      double? periodTime,}) {
    return FixedTransaction(
      name: name ?? _name,
      cost: cost ?? _cost,
      type: type ?? _type,
      typeTransaction: typeTransaction ?? _typeTransaction,
      note: note ?? _note,
      periodTime: periodTime ?? _periodTime,
    );
  }
}


