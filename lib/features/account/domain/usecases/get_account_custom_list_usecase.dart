import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class GetAccountCustomListUseCase{
  final AccountRepository _accountRepository;
  GetAccountCustomListUseCase(this._accountRepository);
  Future<Either<Failure, AccountCustomMediaList>> call({required String sessionId,required String listId})async{
    return await _accountRepository.getAccountCustomList(sessionId: sessionId,listId: listId);
  }
}