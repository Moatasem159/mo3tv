import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class GetSimilarMovieUseCase{
  final MovieRepository _movieRepository;
  GetSimilarMovieUseCase(this._movieRepository);
  Future<Either<Failure, List<Movie>>> call({required int movieId,required int page}) async {
    return await _movieRepository.getSimilarMovies(movieId: movieId,page: page);
  }
}