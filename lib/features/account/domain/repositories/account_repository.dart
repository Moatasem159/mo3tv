import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
abstract class AccountRepository{
  Future<Either<Failure,Account>> getAccountDetails({required String sessionId});
  Future<Either<Failure,AccountListEntity>> getAccountList(
      {required String listType,required String mediaType,required int page,required String lang});
  Future<Either<Failure,Message>> createAccountList({required String sessionId,required Map<String,dynamic> body});
  Future<Either<Failure,List<AccountCustomMediaList>>> getAccountCustomLists(
      {required String sessionId,required String accountId});
  Future<Either<Failure,AccountCustomMediaList>> getAccountCustomList(
      {required String sessionId,required String listId});
  Future<Either<Failure,Message>> clearAccountCustomList(
      {required String sessionId,required String listId});
  Future<void> saveAccountData({required String sessionId,required String accountId});
  Future<void> getAccountData();
}