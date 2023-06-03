import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/models/message_model.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/data/models/account_custom_media_list_model.dart';
import 'package:mo3tv/features/account/data/models/account_list_model.dart';
import 'package:mo3tv/features/account/data/models/account_model.dart';
abstract class AccountRemoteDataSource {
  Future<AccountModel> getAccountDetails({required String sessionId});
  Future<AccountListModel> getAccountList({required String listType,required String mediaType,required int page,required String lang});
  Future<MessageModel> createCustomList({required String sessionId,required Map<String,dynamic> body});
  Future<List<AccountCustomMediaListModel>> getAccountCustomLists({required String sessionId,required String accountId});
}
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource{
  final ApiConsumer _apiConsumer;
  AccountRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<AccountModel> getAccountDetails({required String sessionId}) async=>
 AccountModel.fromJson(await _apiConsumer.get(EndPoints.accountPath(sessionId)));
  @override
  Future<AccountListModel> getAccountList({required String listType,required String mediaType,required int page,required String lang})async {
    final res=await _apiConsumer.get(EndPoints.accountMediaListPath(AppStrings.sessionId,mediaType,listType,page,lang));
    if(mediaType=='movies')
      {
        return AccountListModel.movieListFromJson(res);
      }
    else{
      return AccountListModel.tvShowListFromJson(res);
    }
  }
  @override
  Future<MessageModel> createCustomList({required String sessionId,required Map<String,dynamic> body}) async=>
  MessageModel.fromJson(await _apiConsumer.post(EndPoints.createMediaListPath(sessionId),body: body));

  @override
  Future<List<AccountCustomMediaListModel>> getAccountCustomLists({required String sessionId, required String accountId})async{
    final res = await _apiConsumer.get(EndPoints.getAccountCustomListsPath(sessionId, accountId));
    return List.from(res as List).map((e) =>AccountCustomMediaListModel.fromJson(e)).toList();
  }
}