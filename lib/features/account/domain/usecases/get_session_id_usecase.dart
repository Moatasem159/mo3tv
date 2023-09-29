import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class GetSavedSessionIdUsecase{
  final AccountRepository _accountRepository;
  GetSavedSessionIdUsecase(this._accountRepository);
  Future<void> call() async{
    return await _accountRepository.getSessionId();
  }
}