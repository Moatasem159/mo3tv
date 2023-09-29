import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/data/models/account_model.dart';
abstract class AccountLocalDataSource{
  Future<bool> saveUser({required  accountModel});
  Future getUser();
  Future<void> saveSessionId({required String sessionId});
  Future<void> getSessionId();
}
class AccountLocalDatasourceImpl implements AccountLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  AccountLocalDatasourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<bool> saveUser({required  accountModel}) async{
   return await _sharedPrefrencesConsumer.saveData(key: "account", value: AccountModel.toJsonString(accountModel));
  }
  @override
  Future getUser() async{
    final res=await _sharedPrefrencesConsumer.getData(key: "account");
    if(res!=null)
      {
        return AccountModel.fromJsonString(res);
      }
    else {
      return null;
    }
  }
  @override
  Future<void> saveSessionId({required String sessionId}) async{
   await _sharedPrefrencesConsumer.saveData(key: "sessionId", value:sessionId);
  }
  @override
  Future<void> getSessionId() async{
    AppStrings.sessionId=await _sharedPrefrencesConsumer.getData(key: "sessionId")??'';
  }
}