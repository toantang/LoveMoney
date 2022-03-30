import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction_part.dart';

part 'transaction_dto.g.dart';

@JsonSerializable(explicitToJson: true,)
class TransactionDto {
  final String? id;
  final String? name;
  final double? cost;
  final String typeTransaction; // expense or turnover
  final String? note;
  final String? date;
  final String? userId;
  final TransactionPart? transactionPart;
  final String? endDate;

  TransactionDto({
    this.id,
    this.name,
    this.cost,
    required this.typeTransaction,
    this.userId,
    this.note,
    this.date,
    this.transactionPart,
    this.endDate,
  });

  factory TransactionDto.fromJson(Map<String, dynamic> json) => _$TransactionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionDtoToJson(this);

  TransactionDto copyWith({
    String? id,
    String? name,
    double? cost,
    String? typeTransaction,
    String? note,
    String? date,
    String? userId,
    TransactionPart? transactionPart,
    String? endDate,
  }) {
    return TransactionDto(
      id: id ?? id,
      name: name ?? name,
      cost: cost ?? cost,
      typeTransaction: typeTransaction ?? this.typeTransaction,
      note: note ?? note,
      date: date ?? date,
      userId: userId ?? userId,
      transactionPart: transactionPart ?? this.transactionPart,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  String toString() {
    return 'TransactionDto{id: $id, name: $name, cost: $cost, typeTransaction: $typeTransaction, note: $note, date: $date, userId: $userId, transactionPart: $transactionPart, endDate: $endDate}';
  }
}
