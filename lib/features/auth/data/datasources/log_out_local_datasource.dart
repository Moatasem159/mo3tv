import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
abstract class LogOutLocalDataSource{
  Future<void> clearSessionId();
}
class LogOutLocalDataSourceImpl implements LogOutLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  const LogOutLocalDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<void> clearSessionId()async {
    await _sharedPrefrencesConsumer.remove(key: "sessionId");
  }
}