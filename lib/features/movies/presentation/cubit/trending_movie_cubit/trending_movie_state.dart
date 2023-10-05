import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class TrendingMovieStates {}
class TrendingMovieInitialState extends TrendingMovieStates {}
class GetTrendingMoviesLoadingState extends TrendingMovieStates{}
class GetTrendingMoviesSuccessState extends TrendingMovieStates{
  final List<Movie> movies;
  final String time;
  final String lang;
  GetTrendingMoviesSuccessState(this.movies, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'movies': MovieModel.moviesListToMap(movies as List<MovieModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetTrendingMoviesSuccessState.fromMap(Map<String, dynamic> map) {
    return GetTrendingMoviesSuccessState(
      MovieModel.mapToList(map["movies"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetTrendingMoviesErrorState extends TrendingMovieStates {
  final String msg;
  GetTrendingMoviesErrorState({required this.msg});
}