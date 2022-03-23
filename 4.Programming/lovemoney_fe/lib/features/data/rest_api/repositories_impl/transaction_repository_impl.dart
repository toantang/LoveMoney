import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_result.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/rest_client.dart';
import 'package:lovemoney_fe/features/domain/repositories/transaction_repository.dart';

import '../../../domain/entities/transaction/transaction.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final RestClient _restClient = RestClient();

  @override
  Future<ApiResponse<Transaction>>? createTransaction(
      {required Transaction transaction}) async {
    try {
      var response =
          await _restClient.postMethod('/transaction', data: transaction.toJson());
      print(response.data);
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) => ApiResultSingle<Transaction>(
                json: (json),
                jsonConverter: (json) => Transaction.fromJson(json),
                rootName: 'transaction',
              ));
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}
