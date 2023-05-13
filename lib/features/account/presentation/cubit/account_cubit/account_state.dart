import 'package:mo3tv/features/account/domain/entities/account.dart';
abstract class AccountStates {}
class AccountInitialState extends AccountStates {}
class GetAccountsDetailsLoadingState extends AccountStates {}
class GetAccountsDetailsSuccessState extends AccountStates {
  final Account account;
  GetAccountsDetailsSuccessState(this.account);
}
class GetAccountsDetailsErrorState extends AccountStates {
  final String msg;
  GetAccountsDetailsErrorState({required this.msg});
}