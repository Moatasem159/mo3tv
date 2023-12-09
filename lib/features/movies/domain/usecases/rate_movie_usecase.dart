import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class RateMovieUseCase{
  final MovieRepository _movieRepository;
  const RateMovieUseCase(this._movieRepository);
  Future<Either<Failure, Message>> call(MediaParams params) async=> await _movieRepository.rateMovie(params);
}