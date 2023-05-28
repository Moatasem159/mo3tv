import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetTrendingTvShowsUsecase{
  final TvRepository _tvRepository;
  GetTrendingTvShowsUsecase(this._tvRepository);
  Future<Either<Failure,List<TvShow>>> call({int page=1,required String lang}) async{
    return await _tvRepository.getTrendingTvShows(page:page,lang: lang);
  }
}