import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class GetMovieDetailsUseCase{
  final MovieRepository _movieRepository;
  GetMovieDetailsUseCase(this._movieRepository);
  Future<Either<Failure, Movie>> call({required int movieId,required String lang}) async {
    return await _movieRepository.getMovieDetails(movieId: movieId,lang: lang);
  }
}