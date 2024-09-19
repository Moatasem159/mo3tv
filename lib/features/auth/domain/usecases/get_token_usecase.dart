import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/auth/domain/entities/token.dart';
import 'package:mo3tv/features/auth/domain/repositories/login_repository.dart';

class GetTokenUsecase {
  final LoginRepository _loginRepository;

  const GetTokenUsecase(this._loginRepository);

  Future<ApiResult<Token>> call() async => await _loginRepository.getToken();
}