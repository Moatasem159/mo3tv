import 'package:mo3tv/features/account/data/models/account_model.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
abstract class AccountStates {}
class AccountInitialState extends AccountStates {}
class GetAccountsDetailsLoadingState extends AccountStates {}
class GetAccountsDetailsSuccessState extends AccountStates {
  final Account account;
  final String sessionId;
  GetAccountsDetailsSuccessState(this.account, this.sessionId);
  Map<String, dynamic> toMap() =>{
      'account': AccountModel.accountToJson(account),
      'sessionId':sessionId,
    };
  factory GetAccountsDetailsSuccessState.fromMap(Map<String, dynamic> map)=>
      GetAccountsDetailsSuccessState(AccountModel.fromJson(map['account']),map['sessionId']);
}
class GetAccountsDetailsErrorState extends AccountStates {
  final String msg;
  GetAccountsDetailsErrorState({required this.msg});
}