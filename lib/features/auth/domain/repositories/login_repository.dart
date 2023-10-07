import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/auth/domain/entities/session.dart';
import 'package:mo3tv/features/auth/domain/entities/token.dart';
abstract class LoginRepository{
  Future<Either<Failure,Token>> getToken();
  Future<Either<Failure,Session>> getSessionId({required String token});
}