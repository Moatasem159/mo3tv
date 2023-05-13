abstract class TvStates {}
class TvInitialState extends TvStates {}
class ClearObjectsState extends TvStates{}
class GetTvShowDetailsLoadingState extends TvStates{}
class GetTvShowDetailsSuccessState extends TvStates{}
class GetTvShowDetailsErrorState extends TvStates{
  final String msg;
  GetTvShowDetailsErrorState({required this.msg});
}
