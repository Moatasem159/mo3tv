import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/app_interceptors.dart';
import 'package:mo3tv/core/api/cache_helper.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/api/handling_errors.dart';
import 'package:mo3tv/core/api/status_code.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
class DioConsumer implements ApiConsumer {
  final Dio _client;
  DioConsumer(this._client){
    (_client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _client.interceptors.add(DioCacheInterceptor(options:CacheHelper.customCacheHelper));
    _client.options
      ..connectTimeout=const Duration(seconds: 10)
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      .. receiveDataWhenStatusError= true
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internetServerError;
      };
    _client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      _client.interceptors.add(di.sl<LogInterceptor>());
    }
  }
  @override
  Future get(String path, {Map<String, dynamic>? queryParameters})async{
    try {
      final response = await _client.get(path);
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      HandlingErrors.handleDioError(error);
    }
  }
  @override
  Future post(String path, {Map<String, dynamic>? body, bool formDataIsEnabled = false,}) async {
    try {
      final response = await _client.post(path,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      HandlingErrors.handleDioError(error);
    }
  }
  @override
  Future put(String path, {Map<String, dynamic>? body,}) async {
    try {
      final response = await _client.put(
        path,
        data: body,
      );
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      HandlingErrors.handleDioError(error);
    }
  }
  @override
  Future delete(String path, {Map<String, dynamic>? body,}) async {
    try {
      final response = await _client.delete(path, data: body,);
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
     HandlingErrors.handleDioError(error);
    }
  }
}