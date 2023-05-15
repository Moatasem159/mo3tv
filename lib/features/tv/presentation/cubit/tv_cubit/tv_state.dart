import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
abstract class TvStates {}
class TvInitialState extends TvStates {}
class ClearObjectsState extends TvStates{}
class GetTvShowDetailsLoadingState extends TvStates{}
class GetTvShowDetailsSuccessState extends TvStates{
  final TvShow tvShow;
  GetTvShowDetailsSuccessState(this.tvShow);
}
class GetTvShowDetailsErrorState extends TvStates{
  final String msg;
  GetTvShowDetailsErrorState({required this.msg});
}
