import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
abstract class AccountRepository{
  Future<Either<Failure,Account>> getAccountDetails({required String sessionId});
  Future<Either<Failure,List>> getAccountList({required String listType,required String mediaType});
}