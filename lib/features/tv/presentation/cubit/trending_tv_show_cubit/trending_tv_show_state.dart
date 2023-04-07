import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
abstract class TrendingTvShowStates {}
class TrendingTvShowInitialState extends TrendingTvShowStates{}
class GetTrendingTvShowsLoadingState extends TrendingTvShowStates{}
class GetTrendingTvShowsSuccessState extends TrendingTvShowStates{
  final List<TvShow> trendingTvSHows;
  GetTrendingTvShowsSuccessState(this.trendingTvSHows);
}
class GetTrendingTvShowsErrorState extends TrendingTvShowStates{
  final String msg;
  GetTrendingTvShowsErrorState({required this.msg});
}