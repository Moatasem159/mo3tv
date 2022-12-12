
abstract class AccountStates {}

class AccountInitialState extends AccountStates {}
class GetAccountsListsLoadingState extends AccountStates {}
class GetAccountsListsSuccessState extends AccountStates {}
class GetAccountsListsErrorState extends AccountStates {

  final String msg;

  GetAccountsListsErrorState({required this.msg});
}


