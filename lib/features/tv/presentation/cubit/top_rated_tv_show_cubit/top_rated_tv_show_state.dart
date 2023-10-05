import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
abstract class TopRatedTvShowsStates{}
class TopRatedTvShowInitialState extends TopRatedTvShowsStates{}
class GetTopRatedTvShowsLoadingState extends TopRatedTvShowsStates{}
class GetTopRatedTvShowsSuccessState extends TopRatedTvShowsStates{
  final List<TvShow> tvShows;
  final String time;
  final String lang;
  GetTopRatedTvShowsSuccessState(this.tvShows, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'tvShows': TvShowModel.tvShowsListToMap(tvShows as List<TvShowModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetTopRatedTvShowsSuccessState.fromMap(Map<String, dynamic> map) {
    return GetTopRatedTvShowsSuccessState(
      TvShowModel.mapToList(map["tvShows"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetTopRatedTvShowsErrorState extends TopRatedTvShowsStates{
  final String msg;
  GetTopRatedTvShowsErrorState({required this.msg});
}