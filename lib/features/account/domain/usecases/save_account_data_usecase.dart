import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class SaveAccountDataUsecase{
  final AccountRepository _accountRepository;
  SaveAccountDataUsecase(this._accountRepository);
  Future<void> call({required String sessionId,required String accountId}) async{
    return await _accountRepository.saveAccountData(sessionId: sessionId, accountId: accountId);
  }
}