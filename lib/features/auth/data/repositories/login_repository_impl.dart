import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/auth/data/datasources/login_local_datasource.dart';
import 'package:mo3tv/features/auth/data/datasources/login_remote_datasource.dart';
import 'package:mo3tv/features/auth/data/models/token_model.dart';
import 'package:mo3tv/features/auth/domain/entities/session.dart';
import 'package:mo3tv/features/auth/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final BaseRepository _baseRepository;
  final NetworkInfo _networkInfo;
  final LoginRemoteDataSource _loginRemoteDataSource;
  final LoginLocalDataSource _loginLocalDataSource;

  const LoginRepositoryImpl(this._baseRepository, this._loginRemoteDataSource,
      this._loginLocalDataSource, this._networkInfo);

  @override
  Future<ApiResult<TokenModel>> getToken() async {
    return _baseRepository
        .execute<TokenModel>(() => _loginRemoteDataSource.getTokenRequest());
  }

  @override
  Future<ApiResult<Session>> getSessionId({required String token}) async {
    if (await _networkInfo.isConnected) {
      try {
        final res = await _loginRemoteDataSource.getSessionId(token: token);
        await _loginLocalDataSource.saveSessionId(sessionId: res.sessionId);
        return ApiSuccess(res);
      } on ServerException catch (failure) {
        return ApiFailure(ServerFailure(failure.message!));
      }
    } else {
      return const ApiFailure(ServerFailure(AppStrings.noInternetConnection));
    }
  }
}