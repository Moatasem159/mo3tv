import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class TopRatedMoviesStates {}
class TopRatedMoviesInitialState extends TopRatedMoviesStates {}
class GetTopRatedMoviesLoadingState extends TopRatedMoviesStates{}
class GetTopRatedMoviesSuccessState extends TopRatedMoviesStates{
  final List<Movie> topRatedMovies;
  GetTopRatedMoviesSuccessState(this.topRatedMovies);
}
class GetTopRatedMoviesErrorState extends TopRatedMoviesStates{
  final String msg;
  GetTopRatedMoviesErrorState({required this.msg});
}