abstract class TvShowActionsStates {}
class TvShowActionsInitialState extends TvShowActionsStates {}
class ActionLoadingState extends TvShowActionsStates{}
class ActionSuccessState extends TvShowActionsStates{}
class ActionErrorState extends TvShowActionsStates{
  final String where;
  ActionErrorState({required this.where});
}