import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
abstract class PopularTvShowStates {}
class PopularTvShowInitialState extends PopularTvShowStates {}
class GetPopularTvShowsLoadingState extends PopularTvShowStates{}
class GetPopularTvShowsSuccessState extends PopularTvShowStates{
  final List<TvShow> popularTvShow;
  GetPopularTvShowsSuccessState(this.popularTvShow);
}
class GetPopularTvShowsErrorState extends PopularTvShowStates{
  final String msg;
  GetPopularTvShowsErrorState({required this.msg});
}