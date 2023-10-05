import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
abstract class PlayingNowTvShowStates {}
class PlayingNowTvShowInitialState extends PlayingNowTvShowStates{}
class GetNowPlayingTvShowsLoadingState extends PlayingNowTvShowStates{}
class GetNowPlayingTvShowsSuccessState extends PlayingNowTvShowStates{
  final List<TvShow> tvShows;
  final String time;
  final String lang;
  GetNowPlayingTvShowsSuccessState(this.tvShows, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'tvShows': TvShowModel.tvShowsListToMap(tvShows as List<TvShowModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetNowPlayingTvShowsSuccessState.fromMap(Map<String, dynamic> map) {
    return GetNowPlayingTvShowsSuccessState(
      TvShowModel.mapToList(map["tvShows"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetNowPlayingTvShowsErrorState extends PlayingNowTvShowStates{
  final String msg;
  GetNowPlayingTvShowsErrorState({required this.msg});
}