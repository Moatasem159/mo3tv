import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class PlayingNowMovieStates {}
class PlayingNowMovieInitialState extends PlayingNowMovieStates {}
class GetNowPlayingMoviesLoadingState extends PlayingNowMovieStates{}
class GetNowPlayingMoviesSuccessState extends PlayingNowMovieStates{
  final List<Movie> movies;
  final String time;
  final String lang;
  GetNowPlayingMoviesSuccessState(this.movies, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'movies': MovieModel.moviesListToMap(movies as List<MovieModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetNowPlayingMoviesSuccessState.fromMap(Map<String, dynamic> map) {
    return GetNowPlayingMoviesSuccessState(
      MovieModel.mapToList(map["movies"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetNowPlayingMoviesErrorState extends PlayingNowMovieStates{
  final String msg;
  GetNowPlayingMoviesErrorState({required this.msg});
}