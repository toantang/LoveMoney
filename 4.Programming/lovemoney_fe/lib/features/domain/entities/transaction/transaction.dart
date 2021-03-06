import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction_part.dart';

import '../../../../core/constant/string_const.dart';
import '../user.dart';

part 'transaction.g.dart';

// not use String? _id because this library will not auto create field _id
@JsonSerializable(explicitToJson: true,)
class Transaction {
  final String? id;
  final String? name;
  final double? cost;
  final String
      typeTransaction; // TypeTransactionConst.EXPENSE or TypeTransactionConst.TURNOVER
  final String? note;
  final DateTime? date;
  final User? user;
  final TransactionPart? transactionPart;

  Transaction({
    this.id,
    this.name,
    this.cost,
    required this.typeTransaction,
    this.user,
    this.note,
    this.date,
    this.transactionPart,
  });

  static final Transaction fakeTransaction = Transaction(
    typeTransaction: TypeTransactionConst.EXPENSE,
    name: 'coffee',
    cost: 993.5,
    //date: '03-30-2022',
    date: DateTime(2022, 3, 30),
    user: User.fakeUser,
    transactionPart: TransactionPart.getTransactionPart(
        TypeTransactionPartConst.FIXED_TRANSACTION, 5),
  );

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  Transaction copyWith({
    String? id,
    String? name,
    double? cost,
    String? typeTransaction,
    String? note,
    DateTime? date,
    User? user,
    TransactionPart? transactionPart,
  }) {
    return Transaction(
      id: id ?? this.id,
      name: name ?? this.name,
      cost: cost ?? this.cost,
      typeTransaction: typeTransaction ?? this.typeTransaction,
      note: note ?? this.note,
      date: date ?? this.date,
      user: user ?? this.user,
      transactionPart: transactionPart ?? transactionPart,
    );
  }

  @override
  String toString() {
    return 'Transaction{id: $id, name: $name, cost: $cost, typeTransaction: $typeTransaction, '
        'note: $note, date: $date, user: $user, transactionPart: $transactionPart}';
  }
}
