import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lovemoney_fe/core/constant/api_const.dart';

class RestClient {
  final Dio _dio = Dio();

  static const int TIME_OUT = 10000;

  RestClient() {
    _dio.options
        ..baseUrl = APIConst.baseUrl
        ..responseType = ResponseType.json
        ..connectTimeout = TIME_OUT
        ..sendTimeout = TIME_OUT
        ..receiveTimeout = TIME_OUT;

  }

  void _configRequestHeaders() {
    _dio.options.headers = {
      "Accept": "application/json",
      "content-type": Headers.jsonContentType,
    };

    /*
    final accessToken = AuthenticationStorage().getToken;
    if (accessToken != null)
      _dio.options.headers["Authorization"] = "Bearer $accessToken";
    */
  }

  Future<Response<T>> getMethod<T>(String uri, {required Map<String, dynamic> params}) async {
    _configRequestHeaders();
    log('rest_client.dart', error: 'REQUEST: ' + params.toString());
    return await _dio.get(uri, queryParameters: params);
  }

  Future<Response<T>> postMethod<T>(String uri, {dynamic data}) async {
    _configRequestHeaders();
    log('rest_client.dart', error: 'REQUEST: ' + data.toString());
    return await _dio.post(uri, data: data);
  }

  Future<Response<T>> putMethod<T>(String uri, {dynamic data}) async {
    _configRequestHeaders();
    log('rest_client.dart', error: 'REQUEST: ' + data.toString());
    return await _dio.put(uri, data: data);
  }
  Future<Response<T>> deleteMethod<T>(String uri, {required Map<String, dynamic> params}) async {
    _configRequestHeaders();
    log('rest_client.dart', error: 'REQUEST: ' + params.toString());
    return await _dio.delete(uri, queryParameters: params);
  }

















}