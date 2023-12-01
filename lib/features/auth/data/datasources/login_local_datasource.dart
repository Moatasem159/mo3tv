import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
abstract class LoginLocalDataSource{
  Future<void> saveSessionId({required String sessionId});
}
class LoginLocalDataSourceImpl implements LoginLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  const LoginLocalDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<void> saveSessionId({required String sessionId}) async{
    await _sharedPrefrencesConsumer.saveData(key: "sessionId", value:sessionId);
  }
}