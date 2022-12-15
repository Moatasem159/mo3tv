import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/core/entities/review.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';

class GetTvShowsReviewsUsecase extends BaseUsecase{
  final TvRepository tvRepository;
  GetTvShowsReviewsUsecase(this.tvRepository);
  @override
  Future<Either<Failure, List<Review>>> call(parameters) async{
    return await tvRepository.getTvShowsReviews(tvId:parameters);
  }
}