import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/auth/data/models/log_out_model.dart';
abstract class LogOutRemoteDataSource{
  Future<LogOutModel> logOut({required String sessionId});
}
class LogOutRemoteDataSourceImpl implements LogOutRemoteDataSource{
  final ApiConsumer _apiConsumer;
  const LogOutRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<LogOutModel> logOut({required String sessionId})async {
    final res=await _apiConsumer.delete(EndPoints.logOutPath,body:{"session_id":sessionId});
    return LogOutModel.fromJson(res);
  }
}