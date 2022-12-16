import 'package:equatable/equatable.dart';


abstract class MovieStates extends Equatable{
  @override
  List<Object?> get props => [];
}


class MoviesInitialState extends MovieStates{}
class ClearObjectsState extends MovieStates{}
class GetNowPlayingMoviesLoadingState extends MovieStates{}
class GetNowPlayingMoviesSuccessState extends MovieStates{}
class GetNowPlayingMoviesErrorState extends MovieStates{


  final String msg;

  GetNowPlayingMoviesErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}

class GetPopularMoviesLoadingState extends MovieStates{}
class GetPopularMoviesSuccessState extends MovieStates{}
class GetPopularMoviesErrorState extends MovieStates{


  final String msg;

  GetPopularMoviesErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}


class GetTopRatedMoviesLoadingState extends MovieStates{}
class GetTopRatedMoviesSuccessState extends MovieStates{}
class GetTopRatedMoviesErrorState extends MovieStates{


  final String msg;

  GetTopRatedMoviesErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}

class GetMovieDetailsLoadingState extends MovieStates{}
class GetMovieDetailsSuccessState extends MovieStates{}
class GetMovieDetailsErrorState extends MovieStates{


  final String msg;

  GetMovieDetailsErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}

class GetMovieRecommendationsLoadingState extends MovieStates{}
class GetMovieRecommendationsSuccessState extends MovieStates{}
class GetMovieRecommendationsErrorState extends MovieStates{


  final String msg;

  GetMovieRecommendationsErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}



class GetMovieReviewsLoadingState extends MovieStates{}
class GetMovieReviewsSuccessState extends MovieStates{}
class GetMovieReviewsErrorState extends MovieStates{


  final String msg;

  GetMovieReviewsErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}

class GetMovieCreditsLoadingState extends MovieStates{}
class GetMovieCreditsSuccessState extends MovieStates{}
class GetMovieCreditsErrorState extends MovieStates{


  final String msg;

  GetMovieCreditsErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}

class GetMovieGalleryLoadingState extends MovieStates{}
class GetMovieGallerySuccessState extends MovieStates{}
class GetMovieGalleryErrorState extends MovieStates{


  final String msg;

  GetMovieGalleryErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}

class ChangeGallerySuccessState extends MovieStates{}
class ChangeGalleryLoadingState extends MovieStates{}

class RateMovieLoadingState extends MovieStates{}
class RateMovieSuccessState extends MovieStates{}
class RateMovieErrorState extends MovieStates{


  final String msg;

  RateMovieErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}
class RemoveRateMovieLoadingState extends MovieStates{}
class RemoveRateMovieSuccessState extends MovieStates{}
class RemoveRateMovieErrorState extends MovieStates{


  final String msg;

  RemoveRateMovieErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}

class FavMovieLoadingState extends MovieStates{}
class FavMovieSuccessState extends MovieStates{
  final int statusCode;

  FavMovieSuccessState({required this.statusCode});
}
class FavMovieErrorState extends MovieStates{


  final String msg;

  FavMovieErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}


class AddToWatchListLoadingState extends MovieStates{}
class AddToWatchListSuccessState extends MovieStates{

  final int statusCode;

  AddToWatchListSuccessState({required this.statusCode});

}
class AddToWatchListErrorState extends MovieStates{


  final String msg;

  AddToWatchListErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}

