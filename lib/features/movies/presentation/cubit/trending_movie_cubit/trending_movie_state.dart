import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class TrendingMovieStates {}
class TrendingMovieInitialState extends TrendingMovieStates {}
class GetTrendingMoviesLoadingState extends TrendingMovieStates{}
class GetTrendingMoviesSuccessState extends TrendingMovieStates{
  List<Movie> trendingMovies;
  GetTrendingMoviesSuccessState({required this.trendingMovies});
}
class GetTrendingMoviesErrorState extends TrendingMovieStates {
  final String msg;
  GetTrendingMoviesErrorState({required this.msg});
}