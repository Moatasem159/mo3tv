part of'log_cubit.dart';
abstract class LogStates {}
class LogInitialState extends LogStates {}
class GetTokenLoadingState extends LogStates {}
class GetTokenSuccessState extends LogStates {}
class GetTokenErrorState extends LogStates {
  final String msg;
  GetTokenErrorState({required this.msg});
}
class GetSessionIdLoadingState extends LogStates {}
class GetSessionIdSuccessState extends LogStates {
  final String sessionId;
  GetSessionIdSuccessState(this.sessionId);
}
class GetSessionIdErrorState extends LogStates {
  final String msg;
  GetSessionIdErrorState({required this.msg});
}
class LogOutLoadingState extends LogStates {}
class LogOutSuccessState extends LogStates {}
class LogOutErrorState extends LogStates {}
