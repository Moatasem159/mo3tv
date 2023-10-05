import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class PopularMovieStates {}
class PopularMovieInitialState extends PopularMovieStates {}
class GetPopularMoviesLoadingState extends PopularMovieStates{}
class GetPopularMoviesSuccessState extends PopularMovieStates{
  final List<Movie> movies;
  final String time;
  final String lang;
  GetPopularMoviesSuccessState(this.movies, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'movies': MovieModel.moviesListToMap(movies as List<MovieModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetPopularMoviesSuccessState.fromMap(Map<String, dynamic> map) {
    return GetPopularMoviesSuccessState(
      MovieModel.mapToList(map["movies"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetPopularMoviesErrorState extends PopularMovieStates{
  final String msg;
  GetPopularMoviesErrorState({required this.msg});
}