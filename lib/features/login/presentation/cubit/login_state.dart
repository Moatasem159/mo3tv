
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}
class GetTokenLoadingState extends LoginStates {}
class GetTokenSuccessState extends LoginStates {}
class GetTokenErrorState extends LoginStates {

  final String msg;

  GetTokenErrorState({required this.msg});
}

class GetSessionIdLoadingState extends LoginStates {}
class GetSessionIdSuccessState extends LoginStates {}
class GetSessionIdErrorState extends LoginStates {

  final String msg;

  GetSessionIdErrorState({required this.msg});
}
class LoadingState extends LoginStates {}
class SuccessState extends LoginStates {}
