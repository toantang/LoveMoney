class DigitalType {
  String name;

  DigitalType({required this.name});

  DigitalType copyWith({String? name}) {
    return DigitalType(
      name: name ?? this.name,
    );
  }
}

class DigitalWallet {
  final String? _id;
  final String? _owner;
  final String? _codeWallet;
  final double? _accountBalance;
  final DigitalType? _digitalType;

  DigitalWallet(
      {String? id,
      String? owner,
      String? codeWallet,
      double? accountBalance,
      DigitalType? digitalType})
      : _id = id,
        _owner = owner,
        _codeWallet = codeWallet,
        _accountBalance = accountBalance,
        _digitalType = digitalType;

  DigitalWallet copyWith(
      {String? id,
      String? owner,
      String? codeWallet,
      double? accountBalance,
      DigitalType? digitalType}) {
    return DigitalWallet(
      id: id ?? _id,
      owner: owner ?? _owner,
      codeWallet: codeWallet ?? _codeWallet,
      accountBalance: accountBalance ?? _accountBalance,
      digitalType: digitalType ?? digitalType,
    );
  }
}
