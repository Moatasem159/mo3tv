import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class GetMovieRecommendationsUseCase{
  final MovieRepository _movieRepository;
  GetMovieRecommendationsUseCase(this._movieRepository);
  Future<Either<Failure, List<Movie>>> call({required int movieId,required String lang}) async {
    return await _movieRepository.getMovieRecommendations(movieId: movieId,lang: lang);
  }
}