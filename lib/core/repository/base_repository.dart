import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
abstract class BaseRepository{
  Future<Either<Failure,T>> execute<T>(Future<T> Function() function);
}
class BaseRepositoryImpl implements BaseRepository{
  final NetworkInfo _networkInfo;
  BaseRepositoryImpl(this._networkInfo);
  @override
  Future<Either<Failure,T>> execute<T>(Future<T> Function() function)async{
    if((await _networkInfo.isConnected))
    {
      try {
        final T result = await function();
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