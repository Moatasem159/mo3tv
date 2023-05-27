import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class MovieStates{}
class MoviesInitialState extends MovieStates{}
class GetMovieDetailsLoadingState extends MovieStates{}
class GetMovieDetailsSuccessState extends MovieStates{
  final Movie movie;
  GetMovieDetailsSuccessState(this.movie);
}
class GetMovieDetailsErrorState extends MovieStates{
  final String msg;
  GetMovieDetailsErrorState({required this.msg});
}