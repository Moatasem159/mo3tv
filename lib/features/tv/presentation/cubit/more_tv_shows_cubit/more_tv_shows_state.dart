
abstract class MoreTvShowsStates {}

class MoreTvShowsInitialState extends MoreTvShowsStates {}
class GetMoreTvShowsLoadingState extends MoreTvShowsStates{}
class GetMoreTvShowsSuccessState extends MoreTvShowsStates{}
class GetMoreTvShowsErrorState extends MoreTvShowsStates{
  final String msg;
  GetMoreTvShowsErrorState({required this.msg});
}