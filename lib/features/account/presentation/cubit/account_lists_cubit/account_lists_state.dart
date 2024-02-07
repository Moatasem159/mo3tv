part of"account_lists_cubit.dart";
abstract class AccountListsStates {}
class AccountListsInitialState extends AccountListsStates {}
class GetAccountListsLoadingState extends AccountListsStates {
  final bool isFirstLoading;
  GetAccountListsLoadingState(this.isFirstLoading);
}
class GetAccountListsSuccessState extends AccountListsStates {}
class GetAccountListsErrorState extends AccountListsStates {
  final String msg;
  GetAccountListsErrorState({required this.msg});
}
class UpdateListState extends AccountListsStates {}