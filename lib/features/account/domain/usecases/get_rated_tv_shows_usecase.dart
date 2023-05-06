import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class GetRatedTvShowListUsecase{
  final AccountRepository _accountRepository;
  GetRatedTvShowListUsecase(this._accountRepository);
  Future<Either<Failure,List<TvShow>>> call() async{
    return await _accountRepository.getRatedTvShows();
  }
}