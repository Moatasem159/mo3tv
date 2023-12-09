import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class GetMoviesListUsecase{
  final MovieRepository _movieRepository;
  const GetMoviesListUsecase(this._movieRepository);
  Future<Either<Failure,List<Movie>>> call(MediaParams params)async=>
      await _movieRepository.getMoviesList(params);
}