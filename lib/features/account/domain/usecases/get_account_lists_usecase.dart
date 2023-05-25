import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class GetAccountListsUsecase{
  final AccountRepository _accountRepository;
  GetAccountListsUsecase(this._accountRepository);
  Future<Either<Failure,AccountListEntity>> call({required String listType,required String mediaType,required int page}) async{
    return await _accountRepository.getAccountList(mediaType: mediaType,listType: listType,page: page);
  }
}