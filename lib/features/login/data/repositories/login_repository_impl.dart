import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/login/data/datasources/login_datasource.dart';
import 'package:mo3tv/features/login/data/models/token_model.dart';
import 'package:mo3tv/features/login/domain/entities/session.dart';
import 'package:mo3tv/features/login/domain/repositories/login_repository.dart';
class LoginRepositoryImpl extends LoginRepository{
  final NetworkInfo _networkInfo;
  final LoginDataSource _loginDataSource;
  LoginRepositoryImpl(this._networkInfo,this._loginDataSource);
  @override
  Future<Either<Failure, TokenModel>> getToken() async{

    if(await _networkInfo.isConnected)
      {
        final res = await _loginDataSource.getTokenRequest();

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
      final res = await _loginDataSource.getSessionId(token: token);

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
}