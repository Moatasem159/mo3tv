import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
Future<Either<Failure,T>> executeAndHandleError<T>(Future<T> Function() function,NetworkInfo ?networkInfo)async{
  if((await networkInfo?.isConnected)??true)
  {
    try {
      final  result = await function();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }
  else{
    return left(const ServerFailure(AppStrings.noInternetConnection));
  }
}