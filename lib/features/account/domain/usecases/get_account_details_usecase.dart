import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class GetAccountDetailsUsecase{
  final AccountRepository _accountRepository;
  GetAccountDetailsUsecase(this._accountRepository);
  Future<Either<Failure,Account>> call()async{
    return await _accountRepository.getAccountDetails();
  }
}