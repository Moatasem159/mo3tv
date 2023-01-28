
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';

abstract class TopRatedTvShowsStates{}

class TopRatedTvShowInitialState extends TopRatedTvShowsStates{}

class GetTopRatedTvShowsLoadingState extends TopRatedTvShowsStates{}
class GetTopRatedTvShowsSuccessState extends TopRatedTvShowsStates{

  final List<TvShow> topRatedTvShows;

  GetTopRatedTvShowsSuccessState(this.topRatedTvShows);
}
class GetTopRatedTvShowsErrorState extends TopRatedTvShowsStates{


  final String msg;

  GetTopRatedTvShowsErrorState({required this.msg});
}

