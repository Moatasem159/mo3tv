import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/logout/data/models/log_out_model.dart';
abstract class LogOutRepository{
  Future<Either<Failure,LogOutModel>> logOut({required String sessionId});
}