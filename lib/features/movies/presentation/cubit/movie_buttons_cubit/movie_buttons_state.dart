abstract class MovieButtonsStates {}
class RateMovieInitialState extends MovieButtonsStates {}
class RateMovieLoadingState extends MovieButtonsStates{}
class RateMovieSuccessState extends MovieButtonsStates{
  final int statusCode;

  RateMovieSuccessState(this.statusCode);
}
class RateMovieErrorState extends MovieButtonsStates{
  final String msg;
  RateMovieErrorState({required this.msg});
}
class FavMovieLoadingState extends MovieButtonsStates{}
class FavMovieSuccessState extends MovieButtonsStates{
  final int statusCode;
  FavMovieSuccessState({required this.statusCode});
}
class FavMovieErrorState extends MovieButtonsStates{
  final String msg;
  FavMovieErrorState({required this.msg});
}
class AddToWatchListLoadingState extends MovieButtonsStates{}
class AddToWatchListSuccessState extends MovieButtonsStates{
  final int statusCode;
  AddToWatchListSuccessState({required this.statusCode});
}
class AddToWatchListErrorState extends MovieButtonsStates{
  final String msg;
  AddToWatchListErrorState({required this.msg});
}