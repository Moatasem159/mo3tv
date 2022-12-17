import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class GetTrendingMoviesUsecase extends BaseUsecase{
  final MovieRepository baseMovieRepository;

  GetTrendingMoviesUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(parameters) async{
    return await baseMovieRepository.getTrendingMovies(page:parameters);
  }
}