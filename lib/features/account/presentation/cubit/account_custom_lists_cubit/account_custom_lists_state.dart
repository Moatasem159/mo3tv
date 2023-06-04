import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';

abstract class AccountCustomListsStates {}
class AccountCustomListsInitialState extends AccountCustomListsStates {}
class GetAccountCustomListsLoadingState extends AccountCustomListsStates {}
class GetAccountCustomListsSuccessState extends AccountCustomListsStates {
  final List<AccountCustomMediaList> list;
  GetAccountCustomListsSuccessState(this.list);
}
class GetAccountCustomListsErrorState extends AccountCustomListsStates {}
