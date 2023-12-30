part of 'media_actions_bloc.dart';
abstract class MediaActionsStates {}
class RateMediaInitialState extends MediaActionsStates {}
class ActionLoadingState extends MediaActionsStates{}
class ActionSuccessState extends MediaActionsStates{}
class ActionErrorState extends MediaActionsStates{
  final String where;
  ActionErrorState({required this.where});
}