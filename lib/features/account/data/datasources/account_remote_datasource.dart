import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/data/models/account_list_model.dart';
import 'package:mo3tv/features/account/data/models/account_model.dart';
abstract class AccountRemoteDataSource {
  Future<AccountModel> getAccountDetails({required String sessionId});
  Future<AccountListModel> getAccountList({required String listType,required String mediaType,required int page,required String lang});
}
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource{
  final ApiConsumer _apiConsumer;
  const AccountRemoteDataSourceImpl(this._apiConsumer);
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
}