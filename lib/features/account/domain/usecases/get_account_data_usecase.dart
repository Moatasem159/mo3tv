import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class GetAccountDataUsecase{
  final AccountRepository _accountRepository;
  GetAccountDataUsecase(this._accountRepository);
  Future<void> call() async{
    return await _accountRepository.getAccountData();
  }
}