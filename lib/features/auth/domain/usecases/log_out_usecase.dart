import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/auth/data/models/log_out_model.dart';
import 'package:mo3tv/features/auth/domain/repositories/log_out_repository.dart';

class LogOutUsecase {
  final LogOutRepository _accountRepository;

  const LogOutUsecase(this._accountRepository);

  Future<ApiResult<LogOutModel>> call({required String sessionId}) async =>
      await _accountRepository.logOut(sessionId: sessionId);
}