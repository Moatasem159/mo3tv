import 'package:dartz/dartz.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
abstract class AccountRepository{
  Future<Either<Failure,Account>> getAccountDetails({required String sessionId});
  Future<Either<Failure,AccountListEntity>> getAccountList(MediaParams params);
  Future<void> getSessionId();
}