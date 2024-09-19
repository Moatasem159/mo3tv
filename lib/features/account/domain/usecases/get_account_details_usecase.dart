import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';

class GetAccountDetailsUsecase {
  final AccountRepository _accountRepository;

  const GetAccountDetailsUsecase(this._accountRepository);

  Future<ApiResult<Account>> call({required String sessionId}) async {
    return await _accountRepository.getAccountDetails(sessionId: sessionId);
  }
}