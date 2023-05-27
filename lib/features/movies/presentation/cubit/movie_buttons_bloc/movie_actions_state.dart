abstract class MovieActionsStates {}
class RateMovieInitialState extends MovieActionsStates {}
class ActionLoadingState extends MovieActionsStates{}
class ActionSuccessState extends MovieActionsStates{}
class ActionErrorState extends MovieActionsStates{
  final String where;
  ActionErrorState({required this.where});
}