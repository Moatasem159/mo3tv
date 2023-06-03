import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/data/datasources/account_local_datasource.dart';
import 'package:mo3tv/features/account/data/datasources/account_remote_datasource.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class AccountRepositoryImpl implements AccountRepository{
  final NetworkInfo _networkInfo;
  final AccountRemoteDataSource _accountDataSource;
  final AccountLocalDataSource _accountLocalDataSource;
  AccountRepositoryImpl(this._networkInfo,this._accountDataSource, this._accountLocalDataSource);
  @override
  Future<Either<Failure,Account>> getAccountDetails({required String sessionId})async{
    var result =await _accountLocalDataSource.getUser();
    if(result !=null)
      {
        return right(result);
      }
    else{
      if(await _networkInfo.isConnected)
      {
        try {
          result =await _accountDataSource.getAccountDetails(sessionId: sessionId);
          await _accountLocalDataSource.saveUser(accountModel: result);
          return Right(result);
        } on ServerException catch (failure) {
          return Left(ServerFailure(failure.message!));
        }
      }
      else{
        return left(const ServerFailure(AppStrings.noInternetConnection));
      }
    }
  }
  @override
  Future<Either<Failure,AccountListEntity>> getAccountList({required String listType,required String mediaType,required int page,required String lang})async {
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _accountDataSource.getAccountList(listType: listType,mediaType: mediaType,page: page,lang: lang);
        if(mediaType=="movies")
          {
            return Right(result);
          }
        else{
          return Right(result);
        }
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, Message>> createAccountList({required String sessionId,required Map<String,dynamic> body}) async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _accountDataSource.createCustomList(sessionId: sessionId, body: body);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
}