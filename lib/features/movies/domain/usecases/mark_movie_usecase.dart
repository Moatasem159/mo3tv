import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class MarkMovieUsecase{
  final MovieRepository _movieRepository;
  const MarkMovieUsecase(this._movieRepository);
  Future<Either<Failure, Message>> call(
      {required int movieId,required bool mark,required String markType}) async=>
      await _movieRepository.markMovie(movieId:movieId,mark: mark,markType: markType);
}