import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class MarkMovieAsFavUsecase{
  final MovieRepository baseMovieRepository;
  MarkMovieAsFavUsecase(this.baseMovieRepository);

  Future<Either<Failure, Message>> call({required int movieId,required bool fav}) async{
    return await baseMovieRepository.markMovieFav(movieId:movieId,fav: fav);
  }
}