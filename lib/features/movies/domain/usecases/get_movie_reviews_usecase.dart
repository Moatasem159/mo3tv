import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/review.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class GetMovieReviewsUsecase{
  final MovieRepository _movieRepository;
  GetMovieReviewsUsecase(this._movieRepository);
  Future<Either<Failure, List<Review>>> call({required int movieId}) async{
    return await _movieRepository.getMovieReviews(movieId: movieId);
  }
}