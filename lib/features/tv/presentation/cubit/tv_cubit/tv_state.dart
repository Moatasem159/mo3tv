abstract class TvStates {}

class TvInitialState extends TvStates {}

class ClearObjectsState extends TvStates{}
class GetNowPlayingTvShowsLoadingState extends TvStates{}
class GetNowPlayingTvShowsSuccessState extends TvStates{}
class GetNowPlayingTvShowsErrorState extends TvStates{


  final String msg;

  GetNowPlayingTvShowsErrorState({required this.msg});
}


class GetPopularTvShowsLoadingState extends TvStates{}
class GetPopularTvShowsSuccessState extends TvStates{}
class GetPopularTvShowsErrorState extends TvStates{


  final String msg;

  GetPopularTvShowsErrorState({required this.msg});
}


class GetTopRatedTvShowsLoadingState extends TvStates{}
class GetTopRatedTvShowsSuccessState extends TvStates{}
class GetTopRatedTvShowsErrorState extends TvStates{


  final String msg;

  GetTopRatedTvShowsErrorState({required this.msg});
}

class GetTrendingTvShowsLoadingState extends TvStates{}
class GetTrendingTvShowsSuccessState extends TvStates{}
class GetTrendingTvShowsErrorState extends TvStates{


  final String msg;

  GetTrendingTvShowsErrorState({required this.msg});
}

class GetTvShowDetailsLoadingState extends TvStates{}
class GetTvShowDetailsSuccessState extends TvStates{}
class GetTvShowDetailsErrorState extends TvStates{


  final String msg;

  GetTvShowDetailsErrorState({required this.msg});
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

class GetTvShowCreditsLoadingState extends TvStates{}
class GetTvShowCreditsSuccessState extends TvStates{}
class GetTvShowCreditsErrorState extends TvStates{


  final String msg;

  GetTvShowCreditsErrorState({required this.msg});
}


class GetTvShowGalleryLoadingState extends TvStates{}
class GetTvShowGallerySuccessState extends TvStates{}
class GetTvShowGalleryErrorState extends TvStates{


  final String msg;
  GetTvShowGalleryErrorState({required this.msg});
}


class ChangeGallerySuccessState extends TvStates{}
class ChangeGalleryLoadingState extends TvStates{}

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