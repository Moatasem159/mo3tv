abstract class PopularMovieStates {}
class PopularMovieInitialState extends PopularMovieStates {}
class GetPopularMoviesLoadingState extends PopularMovieStates{}
class GetPopularMoviesSuccessState extends PopularMovieStates{}
class GetPopularMoviesErrorState extends PopularMovieStates{
  final String msg;
  GetPopularMoviesErrorState({required this.msg});
}

