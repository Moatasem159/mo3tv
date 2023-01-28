
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';

abstract class PlayingNowTvShowStates {}

class PlayingNowTvShowInitialState extends PlayingNowTvShowStates{}
class GetNowPlayingTvShowsLoadingState extends PlayingNowTvShowStates{}
class GetNowPlayingTvShowsSuccessState extends PlayingNowTvShowStates{
  final List<TvShow> playingNowTvShows;

  GetNowPlayingTvShowsSuccessState(this.playingNowTvShows);
}
class GetNowPlayingTvShowsErrorState extends PlayingNowTvShowStates{


  final String msg;

  GetNowPlayingTvShowsErrorState({required this.msg});
}