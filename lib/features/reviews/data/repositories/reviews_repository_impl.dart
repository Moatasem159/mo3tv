import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/execute_and_handle_errors.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/reviews/data/datasources/reviews_data_source.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/features/reviews/domain/repositories/reviews_repository.dart';
class ReviewsRepositoryImpl implements ReviewsRepository{
  final NetworkInfo _networkInfo;
  final ReviewsDataSource _reviewsDataSource;
  const ReviewsRepositoryImpl(this._networkInfo, this._reviewsDataSource);
  @override
  Future<Either<Failure, List<Review>>> getMediaReviews(MediaParams params) async{
    return executeAndHandleError<List<Review>>(() => _reviewsDataSource.getMediaReviews(params),_networkInfo);
  }
}