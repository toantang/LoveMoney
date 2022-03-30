import 'package:lovemoney_fe/core/helper/mapper.dart';

import '../domain/entities/transaction/transaction.dart';
import '../dto/transaction_dto.dart';

class TransactionMapper implements Mapper<Transaction, TransactionDto> {

  // ignore: avoid_renaming_method_parameters
  @override
  TransactionDto toDTO(Transaction _transaction) {
    TransactionDto _transactionDto = TransactionDto(
      typeTransaction: _transaction.typeTransaction,
    );

    return _transactionDto.copyWith(
      userId: _transaction.user?.id,
      name: _transaction.name,
      note: _transaction.note,
      date: _transaction.date,
      cost: _transaction.cost,
      transactionPart: _transaction.transactionPart,
    );
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Transaction toEntity(TransactionDto _transactionDto) {
    Transaction _transaction = Transaction(
      typeTransaction: _transactionDto.typeTransaction,
    );
    return _transaction.copyWith(
      id: _transactionDto.id,
      cost: _transactionDto.cost,
      date: _transactionDto.date,
      note: _transactionDto.note,
      name: _transactionDto.name,
      transactionPart: _transactionDto.transactionPart,
    );
  }

  TransactionDto dtoForGetTransaction(Transaction _transaction, String endDate) {
    TransactionDto _transactionDto = TransactionDto(
      typeTransaction: _transaction.typeTransaction,
    );

    return _transactionDto.copyWith(
      date: _transaction.date,
      userId: _transaction.user?.id,
      endDate: endDate,
      transactionPart: _transaction.transactionPart,
    );
  }
}


