import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class CreateAccountListUsecase{
  final AccountRepository _accountRepository;
  CreateAccountListUsecase(this._accountRepository);
  Future<Either<Failure,Message>> call({required String sessionId,required Map<String,dynamic> body})async{
    return await _accountRepository.createAccountList(sessionId: sessionId,body: body);
  }
}