import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/exceptions.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/reviews/data/datasources/reviews_data_source.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/features/reviews/domain/repositories/reviews_repository.dart';
class ReviewsRepositoryImpl implements ReviewsRepository{
  final NetworkInfo _networkInfo;
  final ReviewsDataSource _reviewsDataSource;
  ReviewsRepositoryImpl(this._networkInfo, this._reviewsDataSource);
  @override
  Future<Either<Failure, List<Review>>> getMediaReviews({required int mediaId,required String mediaType}) async{
    if(await _networkInfo.isConnected)
    {
      try {
        final result = await _reviewsDataSource.getMediaReviews(mediaId: mediaId,mediaType: mediaType);
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