import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class GetMovieRecommendationsUseCase{
  final MovieRepository baseMovieRepository;

  GetMovieRecommendationsUseCase({required this.baseMovieRepository});

  Future<Either<Failure, List<Movie>>> call({required int movieId,required int page}) async {
    return await baseMovieRepository.getMovieRecommendations(movieId: movieId, page: page);
  }
}