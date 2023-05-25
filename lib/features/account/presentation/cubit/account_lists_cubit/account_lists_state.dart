abstract class AccountListsStates {}
class AccountListsInitialState extends AccountListsStates {}
class GetAccountListsLoadingState extends AccountListsStates {}
class GetAccountListsSuccessState extends AccountListsStates {}
class GetAccountListsErrorState extends AccountListsStates {
  final String msg;
  GetAccountListsErrorState({required this.msg});
}
class UpdateListState extends AccountListsStates {}