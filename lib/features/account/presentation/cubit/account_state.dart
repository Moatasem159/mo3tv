
abstract class AccountStates {}

class AccountInitialState extends AccountStates {}
class GetAccountsListsLoadingState extends AccountStates {}
class GetAccountsListsSuccessState extends AccountStates {}
class GetAccountsListsErrorState extends AccountStates {

  final String msg;

  GetAccountsListsErrorState({required this.msg});
}

class GetAccountsDetailsLoadingState extends AccountStates {}
class GetAccountsDetailsSuccessState extends AccountStates {}
class GetAccountsDetailsErrorState extends AccountStates {

  final String msg;

  GetAccountsDetailsErrorState({required this.msg});
}
class GetUpdateDetailsLoadingState extends AccountStates {}
class GetUpdateDetailsSuccessState extends AccountStates {}



