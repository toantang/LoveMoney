import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_error.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/domain/entities/transaction/transaction.dart';

abstract class TransactionRepository {
  Future<ApiResponse<Transaction>>? createTransaction({
    required Transaction transaction,
  });

  Future<ApiResponse<Transaction>>? updateTransaction({
    required Transaction transaction,
  });

  Future<ApiResponse<List<Transaction>>>? getListTransaction({
    required Transaction transaction,
    required DateTime endDate,
  });

  Future<ApiResponse<ApiError>>? deleteTransaction({
    required Transaction transaction,
  });
}
