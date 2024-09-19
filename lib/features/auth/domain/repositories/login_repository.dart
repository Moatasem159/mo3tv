import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/auth/data/models/token_model.dart';
import 'package:mo3tv/features/auth/domain/entities/session.dart';

abstract class LoginRepository {
  Future<ApiResult<TokenModel>> getToken();

  Future<ApiResult<Session>> getSessionId({required String token});
}