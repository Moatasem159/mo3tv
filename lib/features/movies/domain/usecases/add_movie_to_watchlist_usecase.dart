import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/movies/domain/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';

class AddMovieToWatchListUseCase{
  final MovieRepository baseMovieRepository;
  AddMovieToWatchListUseCase(this.baseMovieRepository);

  Future<Either<Failure, Message>> call({required int movieId,required bool watchlist}) async{
    return await baseMovieRepository.addMovieToWatchlist(movieId:movieId,watchlist: watchlist);
  }
}