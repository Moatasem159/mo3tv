import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';

class GetRatedTvShowListUsecase extends BaseUsecase{
  final AccountRepository accountRepository;

  GetRatedTvShowListUsecase({required this.accountRepository});

  @override
  Future<Either<Failure,List<TvShow>>> call(parameters) async{
    return await accountRepository.getRatedTvShows();
  }
}