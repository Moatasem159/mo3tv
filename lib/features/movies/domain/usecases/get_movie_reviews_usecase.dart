import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/movies/domain/entities/review.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class GetMovieReviewsUsecase extends BaseUsecase{
  final MovieRepository baseMovieRepository;
  GetMovieReviewsUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Review>>> call(parameters) async{
    return await baseMovieRepository.getMovieReviews(movieId: parameters);
  }
}