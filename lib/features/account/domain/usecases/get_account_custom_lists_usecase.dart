import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class GetAccountCustomListsUseCase{
  final AccountRepository _accountRepository;
  GetAccountCustomListsUseCase(this._accountRepository);
  Future<Either<Failure, List<AccountCustomMediaList>>> call({required String sessionId,required String accountId})async{
    return await _accountRepository.getAccountCustomLists(sessionId: sessionId,accountId: accountId);
  }
}