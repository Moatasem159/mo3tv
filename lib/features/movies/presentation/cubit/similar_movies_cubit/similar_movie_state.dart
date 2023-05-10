abstract class SimilarMovieStates {}
class SimilarMovieInitialState extends SimilarMovieStates {}
class GetSimilarMoviesLoadingState extends SimilarMovieStates{}
class GetSimilarMoviesSuccessState extends SimilarMovieStates{}
class GetSimilarMoviesErrorState extends SimilarMovieStates{
  final String msg;
  GetSimilarMoviesErrorState({required this.msg});
}