import 'package:dartz/dartz.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class GetAccountListsUsecase{
  final AccountRepository _accountRepository;
  const GetAccountListsUsecase(this._accountRepository);
  Future<Either<Failure,AccountListEntity>> call(MediaParams params) async => await _accountRepository.getAccountList(params);
}