abstract class WatchListMovieStates {}
class WatchListMovieInitialState extends WatchListMovieStates {}
class AddToWatchListLoadingState extends WatchListMovieStates{}
class AddToWatchListSuccessState extends WatchListMovieStates{
  final int statusCode;
  AddToWatchListSuccessState({required this.statusCode});
}
class AddToWatchListErrorState extends WatchListMovieStates{
  final String msg;
  AddToWatchListErrorState({required this.msg});
}