import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class ClearAccountCustomListUseCase{
  final AccountRepository _accountRepository;
  ClearAccountCustomListUseCase(this._accountRepository);
  Future<Either<Failure, Message>> call({required String sessionId,required String listId})async{
    return await _accountRepository.clearAccountCustomList(sessionId: sessionId,listId: listId);
  }
}