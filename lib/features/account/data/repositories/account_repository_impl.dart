import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/account/data/datasources/account_local_datasource.dart';
import 'package:mo3tv/features/account/data/datasources/account_remote_datasource.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final BaseRepository _baseRepository;
  final AccountRemoteDataSource _accountRemoteDataSource;
  final AccountLocalDataSource _accountLocalDataSource;

  AccountRepositoryImpl(this._baseRepository, this._accountRemoteDataSource,
      this._accountLocalDataSource);

  @override
  Future<ApiResult<Account>> getAccountDetails(
      {required String sessionId}) async {
    return _baseRepository.execute<Account>(
        () => _accountRemoteDataSource.getAccountDetails(sessionId));
  }

  @override
  Future<ApiResult<AccountListEntity>> getAccountList(
      MediaParams params) async {
    return _baseRepository.execute<AccountListEntity>(
        () => _accountRemoteDataSource.getAccountList(params));
  }

  @override
  Future<void> getSessionId() async => _accountLocalDataSource.getSessionId();
}