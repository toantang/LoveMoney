import 'dart:developer';

import 'package:lovemoney_fe/configs/api_config.dart';
import 'package:lovemoney_fe/core/error/custom_error.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_error.dart';
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
      var response = await _restClient.postMethod(
        ApiConfig.createTransaction,
        data: transactionDto.toJson(),
      );
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
          ApiConfig.updateTransactionById + transaction.id.toString(),
          data: transactionDto.toJson());
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) => ApiResultSingle<Transaction>(
                json: (json),
                rootName: 'transaction',
                jsonConverter: (json) =>
                    _transactionMapper.toEntity(TransactionDto.fromJson(json)),
              ));
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<List<Transaction>>>? getListTransaction({
    required Transaction transaction,
    required DateTime endDate,
  }) async {
    final TransactionDto transactionDto =
        _transactionMapper.dtoForGetTransaction(transaction, endDate);
    try {
      var response = await _restClient.getMethod(
        ApiConfig.getListTransaction,
        params: transactionDto.toJson(),
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
      print(error.toString());
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<ApiError>>? deleteTransaction(
      {required Transaction transaction}) async {
    final TransactionDto transactionDto = _transactionMapper.toDTO(transaction);
    try {
      var response = await _restClient.deleteMethod(
        ApiConfig.deleteTransaction + transactionDto.id.toString(),
        params: transactionDto.toJson(),
      );
      return ApiResponse.catchError(response: response as Map<String, dynamic>);
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}
