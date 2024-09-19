import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/auth/domain/entities/session.dart';
import 'package:mo3tv/features/auth/domain/repositories/login_repository.dart';

class GetSessionIdUsecase {
  final LoginRepository _loginRepository;

  const GetSessionIdUsecase(this._loginRepository);

  Future<ApiResult<Session>> call({required String token}) async =>
      await _loginRepository.getSessionId(token: token);
}