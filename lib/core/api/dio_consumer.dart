import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/app_interceptors.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/api/env.dart';
import 'package:mo3tv/core/api/handling_errors.dart';
import 'package:mo3tv/core/api/status_code.dart';

class DioConsumer implements ApiConsumer {
  final Dio _client;

  DioConsumer(this._client) {
    HttpClient client = HttpClient();
    (_client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _client.options
      ..baseUrl = EndPoints.baseUrl
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15)
      ..responseType = ResponseType.plain
      ..receiveDataWhenStatusError = true
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internetServerError;
      };
    _client.interceptors.add(AppInterceptors());
    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters["api_key"] = Env.apiKey;
        handler.next(options);
      },
    ));
    if (kDebugMode) {
      _client.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _client.get(path, queryParameters: queryParameters);
      return jsonDecode(response.data.toString());
    } on DioException catch (error) {
      HandlingErrors.handleDioError(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body, bool formDataIsEnabled = false}) async {
    try {
      final response = await _client.post(path,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      return jsonDecode(response.data.toString());
    } on DioException catch (error) {
      HandlingErrors.handleDioError(error);
    }
  }

  @override
  Future put(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await _client.put(path, data: body);
      return jsonDecode(response.data.toString());
    } on DioException catch (error) {
      HandlingErrors.handleDioError(error);
    }
  }

  @override
  Future delete(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await _client.delete(path, data: body);
      return jsonDecode(response.data.toString());
    } on DioException catch (error) {
      HandlingErrors.handleDioError(error);
    }
  }
}