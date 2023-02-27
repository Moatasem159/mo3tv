import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/app_interceptors.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/api/status_code.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      .. receiveDataWhenStatusError= true
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internetServerError;
      };
    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters})async{
    try {
      final response = await client.get(path);
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path, {Map<String, dynamic>? body, bool formDataIsEnabled = false,}) async {
    try {
      final response = await client.post(path,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }


  @override
  Future put(String path, {Map<String, dynamic>? body,}) async {
    try {
      final response = await client.put(
        path,
        data: body,
      );
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future delete(String path, {Map<String, dynamic>? body,}) async {
    try {
      final response = await client.delete(path, data: body,);
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }


  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectionError:
      case DioErrorType.cancel:
        throw const FetchDataException();
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internetServerError:
            throw const InternetServerErrorException();
        }
        break;
      case DioErrorType.badCertificate:
        throw const BadRequestException();
      case DioErrorType.unknown:
        throw const InternetServerErrorException();
    }
  }
}
