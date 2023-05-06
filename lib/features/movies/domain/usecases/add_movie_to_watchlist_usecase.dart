import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
class AddMovieToWatchListUseCase{
  final MovieRepository _movieRepository;
  AddMovieToWatchListUseCase(this._movieRepository);
  Future<Either<Failure, Message>> call({required int movieId,required bool watchlist}) async{
    return await _movieRepository.addMovieToWatchlist(movieId:movieId,watchlist: watchlist);
  }
}