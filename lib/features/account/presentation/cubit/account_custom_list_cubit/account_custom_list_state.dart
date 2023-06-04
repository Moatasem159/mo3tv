import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';

abstract class AccountCustomListStates {}
class AccountCustomListInitialState extends AccountCustomListStates {}
class GetAccountCustomListLoadingState extends AccountCustomListStates {}
class GetAccountCustomListSuccessState extends AccountCustomListStates {
  final AccountCustomMediaList list;
  GetAccountCustomListSuccessState(this.list);
}
class GetAccountCustomListErrorState extends AccountCustomListStates {}
