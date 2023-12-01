import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class DeleteRateMovieUseCase {
  final MovieRepository _movieRepository;
  const DeleteRateMovieUseCase(this._movieRepository);
  Future<Either<Failure, Message>> call({required int movieId}) async =>
      await _movieRepository.deleteMovieRate(movieId: movieId);
}