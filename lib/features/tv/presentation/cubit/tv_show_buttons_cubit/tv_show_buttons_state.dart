abstract class TvShowButtonsStates {}

class TvShowButtonsInitialState extends TvShowButtonsStates {}
class FavTvShowLoadingState extends TvShowButtonsStates{}
class FavTvShowSuccessState extends TvShowButtonsStates{
  final int statusCode;
  FavTvShowSuccessState({required this.statusCode});
}
class FavTvShowErrorState extends TvShowButtonsStates{
  final String msg;
  FavTvShowErrorState({required this.msg});

}
class AddToWatchListLoadingState extends TvShowButtonsStates{}
class AddToWatchListSuccessState extends TvShowButtonsStates{
  final int statusCode;
  AddToWatchListSuccessState({required this.statusCode});
}
class AddToWatchListErrorState extends TvShowButtonsStates{
  final String msg;
  AddToWatchListErrorState({required this.msg});
}
class RateTvShowLoadingState extends TvShowButtonsStates{}
class RateTvShowSuccessState extends TvShowButtonsStates{
  final int statusCode;
  RateTvShowSuccessState(this.statusCode);
}
class RateTvShowErrorState extends TvShowButtonsStates{
  final String msg;
  RateTvShowErrorState({required this.msg});
}

