import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class TopRatedMoviesStates {}
class TopRatedMoviesInitialState extends TopRatedMoviesStates {}
class GetTopRatedMoviesLoadingState extends TopRatedMoviesStates{}
class GetTopRatedMoviesSuccessState extends TopRatedMoviesStates{
  final List<Movie> movies;
  final String time;
  final String lang;
  GetTopRatedMoviesSuccessState(this.movies, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'movies': MovieModel.moviesListToMap(movies as List<MovieModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetTopRatedMoviesSuccessState.fromMap(Map<String, dynamic> map) {
    return GetTopRatedMoviesSuccessState(
      MovieModel.mapToList(map["movies"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetTopRatedMoviesErrorState extends TopRatedMoviesStates{
  final String msg;
  GetTopRatedMoviesErrorState({required this.msg});
}