import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
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
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..headers= {"lang":"en"}
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
  Future get(String path, {Map<String, dynamic>? queryParameters,String? token,String lang='en'}) async {
    try {
      final response = await client.get(
          path,
          queryParameters: queryParameters,
        options: Options(
            headers:{
          "lang":lang,
          'Authorization': token,
        }

        )
      );
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
        String lang='en',
      String? token,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {

    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          options:Options(headers: {
            'Authorization': token,
            "lang":lang,
            "Content-Type":"application/json",
          }) ,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
        String? token,
        String lang='en',
        int ?id,
        Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: {
            "Content-Type":"application/json",
            "lang":lang,
            'Authorization': token,
          }
        ),

      );
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? body,
        String? token,
        String lang='en',
        int ?id,
        Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.delete(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
            headers: {
              "Content-Type":"application/json",
              "lang":lang,
              'Authorization': token,
            }
        ),

      );
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }


  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
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
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
