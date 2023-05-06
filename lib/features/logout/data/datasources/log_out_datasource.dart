import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/logout/data/models/log_out_model.dart';
abstract class LogOutDataSource{
  Future<LogOutModel> logOut({required String sessionId});
}
class LogOutDataSourceImpl extends LogOutDataSource{
  final ApiConsumer _apiConsumer;
  LogOutDataSourceImpl(this._apiConsumer);
  @override
  Future<LogOutModel> logOut({required String sessionId})async {
    final res=await _apiConsumer.delete(EndPoints.logOutPath,body: {
      "session_id":sessionId
    });
    return LogOutModel.fromJson(res);
  }
}