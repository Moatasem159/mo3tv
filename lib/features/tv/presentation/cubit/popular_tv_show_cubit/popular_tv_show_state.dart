import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
abstract class PopularTvShowStates {}
class PopularTvShowInitialState extends PopularTvShowStates {}
class GetPopularTvShowsLoadingState extends PopularTvShowStates{}
class GetPopularTvShowsSuccessState extends PopularTvShowStates{
  final List<TvShow> tvShows;
  final String time;
  final String lang;
  GetPopularTvShowsSuccessState(this.tvShows, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'tvShows': TvShowModel.tvShowsListToMap(tvShows as List<TvShowModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetPopularTvShowsSuccessState.fromMap(Map<String, dynamic> map) {
    return GetPopularTvShowsSuccessState(
      TvShowModel.mapToList(map["tvShows"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetPopularTvShowsErrorState extends PopularTvShowStates{
  final String msg;
  GetPopularTvShowsErrorState({required this.msg});
}