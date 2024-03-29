import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/auth/data/datasources/log_out_datasource.dart';
import 'package:mo3tv/features/auth/data/datasources/log_out_local_datasource.dart';
import 'package:mo3tv/features/auth/data/models/log_out_model.dart';
import 'package:mo3tv/features/auth/domain/repositories/log_out_repository.dart';
class LogOutRepositoryImpl implements LogOutRepository{
  final NetworkInfo _networkInfo;
  final LogOutRemoteDataSource _logOutRemoteDataSource;
  final LogOutLocalDataSource _logOutLocalDataSource;
  const LogOutRepositoryImpl(this._networkInfo, this._logOutRemoteDataSource, this._logOutLocalDataSource);
  @override
  Future<Either<Failure, LogOutModel>> logOut({required String sessionId})async {
    if(await _networkInfo.isConnected)
    {
      final result = await _logOutRemoteDataSource.logOut(sessionId: sessionId);
      try {
        await _logOutLocalDataSource.clearSessionId();
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