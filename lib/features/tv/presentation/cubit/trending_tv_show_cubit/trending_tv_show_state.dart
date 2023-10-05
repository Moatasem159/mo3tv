import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
abstract class TrendingTvShowStates {}
class TrendingTvShowInitialState extends TrendingTvShowStates{}
class GetTrendingTvShowsLoadingState extends TrendingTvShowStates{}
class GetTrendingTvShowsSuccessState extends TrendingTvShowStates{
  final List<TvShow> tvShows;
  final String time;
  final String lang;
  GetTrendingTvShowsSuccessState(this.tvShows, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'tvShows': TvShowModel.tvShowsListToMap(tvShows as List<TvShowModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetTrendingTvShowsSuccessState.fromMap(Map<String, dynamic> map) {
    return GetTrendingTvShowsSuccessState(
      TvShowModel.mapToList(map["tvShows"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetTrendingTvShowsErrorState extends TrendingTvShowStates{
  final String msg;
  GetTrendingTvShowsErrorState({required this.msg});
}