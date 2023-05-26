import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class GetMoviesListUsecase{
final MovieRepository _movieRepository;
  GetMoviesListUsecase(this._movieRepository);
  Future<Either<Failure,List<Movie>>> call({int page=1,required String listType})async{
   return await _movieRepository.getMoviesList(page: page,listType: listType);
  }
}