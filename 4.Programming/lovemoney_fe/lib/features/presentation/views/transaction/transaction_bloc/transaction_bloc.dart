import 'package:lovemoney_fe/core/error/custom_error.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_error.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/transaction_repository_impl.dart';

import '../../../../domain/entities/transaction/transaction.dart';

class TransactionBloc {
  final TransactionRepositoryImpl _transactionRepositoryImpl = TransactionRepositoryImpl();

  Future<CustomError> deleteTransaction({required Transaction transaction}) async {
    ApiResponse? apiResponse = await _transactionRepositoryImpl.deleteTransaction(transaction: transaction);
    if (apiResponse == null) {
      return CustomError(code: ErrorCode.FAILED, name: 'api response is null');
    }
    ApiError? apiError = apiResponse.error;
    if (apiError == null) {
      return CustomError(code: ErrorCode.FAILED, name: 'can not catch api error');
    }
    return CustomError(code: ErrorCode.SUCCESS, name: apiError.message);
  }
}