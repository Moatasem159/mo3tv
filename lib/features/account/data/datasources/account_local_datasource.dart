import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/features/account/data/models/account_model.dart';
abstract class AccountLocalDataSource{
  Future<bool> saveUser({required  accountModel});
  Future getUser();
}
class AccountLocalDatasourceImpl implements AccountLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  AccountLocalDatasourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<bool> saveUser({required  accountModel}) async{
    final res=await _sharedPrefrencesConsumer.saveData(key: "account", value: AccountModel.toJsonString(accountModel));
    return res;
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
}