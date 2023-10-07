import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/auth/data/datasources/login_local_datasource.dart';
import 'package:mo3tv/features/auth/data/datasources/login_remote_datasource.dart';
import 'package:mo3tv/features/auth/data/models/token_model.dart';
import 'package:mo3tv/features/auth/domain/entities/session.dart';
import 'package:mo3tv/features/auth/domain/repositories/login_repository.dart';
class LoginRepositoryImpl implements LoginRepository{
  final NetworkInfo _networkInfo;
  final LoginRemoteDataSource _loginRemoteDataSource;
  final LoginLocalDataSource _loginLocalDataSource;
  LoginRepositoryImpl(this._networkInfo,this._loginRemoteDataSource, this._loginLocalDataSource);
  @override
  Future<Either<Failure, TokenModel>> getToken() async{
    if(await _networkInfo.isConnected)
      {
        final res = await _loginRemoteDataSource.getTokenRequest();
        try {
          return Right(res);
        } on ServerException catch (failure) {
          return Left(ServerFailure(failure.message!));
        }
      }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
  @override
  Future<Either<Failure, Session>> getSessionId({required String token}) async{
    if(await _networkInfo.isConnected)
    {
      final res = await _loginRemoteDataSource.getSessionId(token: token);
      try {
        await _loginLocalDataSource.saveSessionId(sessionId: res.sessionId);
        return Right(res);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.message!));
      }
    }
    else{
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
}