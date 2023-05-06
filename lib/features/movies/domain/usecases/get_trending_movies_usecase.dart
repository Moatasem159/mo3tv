import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class GetTrendingMoviesUsecase{
  final MovieRepository _movieRepository;
  GetTrendingMoviesUsecase(this._movieRepository);
  Future<Either<Failure, List<Movie>>> call({required int page}) async{
    return await _movieRepository.getTrendingMovies(page:page);
  }
}