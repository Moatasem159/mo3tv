import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
abstract class AccountLocalDataSource{
  Future<void> getSessionId();
}
class AccountLocalDatasourceImpl implements AccountLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  const AccountLocalDatasourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<void> getSessionId() async{
    AppStrings.sessionId=await _sharedPrefrencesConsumer.getData(key: "sessionId")??'';
  }
}