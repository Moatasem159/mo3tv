import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class GetMoviesListStates {}
class GetMoviesListInitialState extends GetMoviesListStates {}
class GetMoviesListLoadingState extends GetMoviesListStates{}
class GetMoviesListSuccessState extends GetMoviesListStates{
  final List<Movie> movies;
  final String time;
  final String lang;
  GetMoviesListSuccessState(this.movies, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'movies': MovieModel.moviesListToMap(movies as List<MovieModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetMoviesListSuccessState.fromMap(Map<String, dynamic> map) {
    return GetMoviesListSuccessState(
      MovieModel.mapToList(map["movies"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetMoviesListErrorState extends GetMoviesListStates{
  final String msg;
  GetMoviesListErrorState({required this.msg});
}