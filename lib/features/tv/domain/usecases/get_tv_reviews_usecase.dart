import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/review.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetTvShowsReviewsUsecase{
  final TvRepository _tvRepository;
  GetTvShowsReviewsUsecase(this._tvRepository);
  Future<Either<Failure, List<Review>>> call({required int tvId}) async{
    return await _tvRepository.getTvShowsReviews(tvId:tvId);
  }
}