import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_result.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/rest_client.dart';
import 'package:lovemoney_fe/features/domain/repositories/transaction_repository.dart';
import 'package:lovemoney_fe/features/dto/transaction_dto.dart';
import 'package:lovemoney_fe/features/mapper/transaction_mapper.dart';

import '../../../domain/entities/transaction/transaction.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final RestClient _restClient = RestClient();
  final TransactionMapper _transactionMapper = TransactionMapper();

  @override
  Future<ApiResponse<Transaction>>? createTransaction(
      {required Transaction transaction}) async {
    final TransactionDto transactionDto = _transactionMapper.toDTO(transaction);
    try {
      print('request: ' + transactionDto.toJson().toString());
      var response = await _restClient.postMethod('/transaction',
          data: transactionDto.toJson(),);
      //print('response: ' + response.data);
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) => ApiResultSingle<Transaction>(
                json: (json),
                jsonConverter: (json) =>
                    _transactionMapper.toEntity(TransactionDto.fromJson(json)),
                rootName: 'transaction',
              ));
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<Transaction>>? updateTransaction(
      {required Transaction transaction}) async {
    final TransactionDto transactionDto = _transactionMapper.toDTO(transaction);
    try {
      var response = await _restClient.putMethod(
          '/transaction/update/${transaction.id}',
          data: transactionDto.toJson());
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) => ApiResultSingle(
                json: (json),
                rootName: '/transaction',
                jsonConverter: (json) =>
                    _transactionMapper.toEntity(TransactionDto.fromJson(json)),
              ));
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<List<Transaction>>>? getTransaction({
    required Transaction transaction,
    required String endDate,
  }) async {
    final TransactionDto transactionDto =
        _transactionMapper.dtoForGetTransaction(transaction, endDate);
    print("transactionDto.toString()" + transactionDto.toString());
    try {
      print('transactionDto.toJson: ' + transactionDto.toJson().toString());
      var response = await _restClient.getMethod(
        '/transaction/getListTransaction',
        params: transactionDto.toJson(),
        /*params: {
          "userId": "1",
          "typeTransaction": "Turnover",
          "date": "03-27-2022",
          "endDate": "03-28-2022"
        }*/
      );
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) => ApiResultList<Transaction>(
                json: json,
                rootName: 'transactions',
                jsonConverter: (json) =>
                    _transactionMapper.toEntity(TransactionDto.fromJson(json)),
              ));
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}
