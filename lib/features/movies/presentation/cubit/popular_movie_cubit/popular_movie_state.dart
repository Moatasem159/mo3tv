import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class PopularMovieStates {}
class PopularMovieInitialState extends PopularMovieStates {}
class GetPopularMoviesLoadingState extends PopularMovieStates{}
class GetPopularMoviesSuccessState extends PopularMovieStates{
  final List<Movie> popularMovies;
  GetPopularMoviesSuccessState(this.popularMovies);
}
class GetPopularMoviesErrorState extends PopularMovieStates{
  final String msg;
  GetPopularMoviesErrorState({required this.msg});
}