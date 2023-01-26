import 'package:mo3tv/features/movies/domain/entities/movie.dart';

abstract class PlayingNowMovieStates {}

class PlayingNowMovieInitialState extends PlayingNowMovieStates {}
class GetNowPlayingMoviesLoadingState extends PlayingNowMovieStates{}
class GetNowPlayingMoviesSuccessState extends PlayingNowMovieStates{

  List<Movie> nowPlayingMovies;

  GetNowPlayingMoviesSuccessState({required this.nowPlayingMovies});
}
class GetNowPlayingMoviesErrorState extends PlayingNowMovieStates{
  final String msg;
  GetNowPlayingMoviesErrorState({required this.msg});
}