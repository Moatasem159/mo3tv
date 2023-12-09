import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/execute_and_handle_errors.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/account/data/datasources/account_local_datasource.dart';
import 'package:mo3tv/features/account/data/datasources/account_remote_datasource.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class AccountRepositoryImpl implements AccountRepository{
  final NetworkInfo _networkInfo;
  final AccountRemoteDataSource _accountRemoteDataSource;
  final AccountLocalDataSource _accountLocalDataSource;
  AccountRepositoryImpl(this._networkInfo,this._accountRemoteDataSource, this._accountLocalDataSource);
  @override
  Future<Either<Failure,Account>> getAccountDetails({required String sessionId})async{
    return executeAndHandleError<Account>(() => _accountRemoteDataSource.getAccountDetails(sessionId),_networkInfo);
  }
  @override
  Future<Either<Failure,AccountListEntity>> getAccountList(MediaParams params)async {
    return executeAndHandleError<AccountListEntity>(() => _accountRemoteDataSource.getAccountList(params),_networkInfo);
  }
  @override
  Future<void> getSessionId()async =>_accountLocalDataSource.getSessionId();
}