import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
class GetAccountMoviesListUsecase{
  final AccountRepository _accountRepository;
  GetAccountMoviesListUsecase(this._accountRepository);
  Future<Either<Failure,List>> call({required String listType,required String mediaType}) async{
    return await _accountRepository.getAccountList(mediaType: mediaType,listType: listType);
  }
}