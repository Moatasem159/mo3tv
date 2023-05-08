import 'package:dio/dio.dart';
import 'package:mo3tv/core/api/status_code.dart';
import 'package:mo3tv/core/error/exceptions.dart';
abstract class HandlingErrors{
 static handleDioError(DioError error) {
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