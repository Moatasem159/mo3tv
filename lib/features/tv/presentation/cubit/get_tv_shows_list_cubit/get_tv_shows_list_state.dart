import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
abstract class GetTvShowsListStates {}
class GetTvShowsListInitialState extends GetTvShowsListStates{}
class GetTvShowsListLoadingState extends GetTvShowsListStates{}
class GetTvShowsListSuccessState extends GetTvShowsListStates{
  final List<TvShow> tvShows;
  final String time;
  final String lang;
  GetTvShowsListSuccessState(this.tvShows, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'tvShows': TvShowModel.tvShowsListToMap(tvShows as List<TvShowModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetTvShowsListSuccessState.fromMap(Map<String, dynamic> map) {
    return GetTvShowsListSuccessState(
      TvShowModel.mapToList(map["tvShows"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetTvShowsListErrorState extends GetTvShowsListStates{
  final String msg;
  GetTvShowsListErrorState({required this.msg});
}