import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/credits/data/datasources/credits_data_source.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/features/credits/domain/repositories/credits_repository.dart';
class CreditsRepositoryImpl implements CreditsRepository{
  final NetworkInfo _networkInfo;
  final CreditsDataSource _creditsDataSource;
  const CreditsRepositoryImpl(this._networkInfo, this._creditsDataSource);
  @override
  Future<Either<Failure,List<CastMember>>> getMediaCredits({required int mediaId,required String mediaType})async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _creditsDataSource.getMediaCredits(mediaId: mediaId,mediaType: mediaType);
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