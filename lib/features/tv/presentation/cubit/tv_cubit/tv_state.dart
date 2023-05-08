abstract class TvStates {}
class TvInitialState extends TvStates {}
class ClearObjectsState extends TvStates{}
class GetTvShowDetailsLoadingState extends TvStates{}
class GetTvShowDetailsSuccessState extends TvStates{}
class GetTvShowDetailsErrorState extends TvStates{
  final String msg;
  GetTvShowDetailsErrorState({required this.msg});
}
class GetTvShowSeasonDetailsLoadingState extends TvStates{}
class GetTvShowSeasonDetailsSuccessState extends TvStates{}
class GetTvShowSeasonDetailsErrorState extends TvStates{
  final String msg;
  GetTvShowSeasonDetailsErrorState({required this.msg});
}
class GetTvShowRecommendationsLoadingState extends TvStates{}
class GetTvShowRecommendationsSuccessState extends TvStates{}
class GetTvShowRecommendationsErrorState extends TvStates{
  final String msg;
  GetTvShowRecommendationsErrorState({required this.msg});
}
class GetTvShowReviewsLoadingState extends TvStates{}
class GetTvShowReviewsSuccessState extends TvStates{}
class GetTvShowReviewsErrorState extends TvStates{
  final String msg;
  GetTvShowReviewsErrorState({required this.msg});
}
class FavTvShowLoadingState extends TvStates{}
class FavTvShowSuccessState extends TvStates{
  final int statusCode;
  FavTvShowSuccessState({required this.statusCode});
}
class FavTvShowErrorState extends TvStates{
  final String msg;
  FavTvShowErrorState({required this.msg});

}
class AddToWatchListLoadingState extends TvStates{}
class AddToWatchListSuccessState extends TvStates{
  final int statusCode;
  AddToWatchListSuccessState({required this.statusCode});
}
class AddToWatchListErrorState extends TvStates{
  final String msg;
  AddToWatchListErrorState({required this.msg});
}
class RateTvShowLoadingState extends TvStates{}
class RateTvShowSuccessState extends TvStates{}
class RateTvShowErrorState extends TvStates{
  final String msg;
  RateTvShowErrorState({required this.msg});
}
class RemoveRateTvShowLoadingState extends TvStates{}
class RemoveRateTvShowSuccessState extends TvStates{}
class RemoveRateTvShowErrorState extends TvStates{
  final String msg;
  RemoveRateTvShowErrorState({required this.msg});
}