import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/account/domain/entities/account.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';


class GetAccountDetailsUsecase extends BaseUsecase{
  final AccountRepository accountRepository;

  GetAccountDetailsUsecase({required this.accountRepository});

  @override
  Future<Either<Failure,Account>> call(parameters)async{
    return await accountRepository.getAccountDetails();
  }
}