import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
class AppInterceptors extends Interceptor{
@override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  if(kDebugMode){
    print('REQUEST[${options.method}] => PATH: ${options.path}');
  }
  options.headers["Content-type"]="application/json";
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if(kDebugMode){
      print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    super.onResponse(response, handler);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if(kDebugMode){
      print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }
    super.onError(err, handler);
  }
}