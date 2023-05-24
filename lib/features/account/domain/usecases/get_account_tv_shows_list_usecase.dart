import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class GetAccountTvShowListUsecase{
  final AccountRepository _accountRepository;
  GetAccountTvShowListUsecase(this._accountRepository);
  Future<Either<Failure,List>> call({required String listType,required String mediaType}) async{
    return await _accountRepository.getAccountList(listType: listType, mediaType: mediaType);
  }
}