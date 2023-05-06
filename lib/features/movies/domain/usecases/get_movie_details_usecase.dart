import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class GetMovieDetailsUseCase extends BaseUsecase {
  final MovieRepository _movieRepository;
  GetMovieDetailsUseCase(this._movieRepository);
  @override
  Future<Either<Failure, Movie>> call(parameters) async {
    return await _movieRepository.getMovieDetails(movieId: parameters);
  }
}