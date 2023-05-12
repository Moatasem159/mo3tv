abstract class RateMovieStates {}
class RateMovieInitialState extends RateMovieStates {}
class RateMovieLoadingState extends RateMovieStates{}
class RateMovieSuccessState extends RateMovieStates{
  final int statusCode;

  RateMovieSuccessState(this.statusCode);
}
class RateMovieErrorState extends RateMovieStates{
  final String msg;
  RateMovieErrorState({required this.msg});
}
