import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class MarkMovieAsFavUsecase{
  final MovieRepository _movieRepository;
  MarkMovieAsFavUsecase(this._movieRepository);
  Future<Either<Failure, Message>> call({required int movieId,required bool fav}) async{
    return await _movieRepository.markMovieFav(movieId:movieId,fav: fav);
  }
}