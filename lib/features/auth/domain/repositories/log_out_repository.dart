import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/auth/data/models/log_out_model.dart';

abstract class LogOutRepository {
  Future<ApiResult<LogOutModel>> logOut({required String sessionId});
}