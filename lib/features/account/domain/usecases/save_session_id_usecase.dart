import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class SaveSessionIdUsecase{
  final AccountRepository _accountRepository;
  SaveSessionIdUsecase(this._accountRepository);
  Future<void> call({required String sessionId}) async{
    return await _accountRepository.saveSessionId(sessionId: sessionId);
  }
}