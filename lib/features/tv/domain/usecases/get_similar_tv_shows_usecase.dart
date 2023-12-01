import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetSimilarTvShowsUseCase{
  final TvRepository _tvRepository;
  const GetSimilarTvShowsUseCase(this._tvRepository);
  Future<Either<Failure, List<TvShow>>> call({required int tvId,required int page,required String lang}) async=>
      await _tvRepository.getSimilarTvShows(tvId: tvId,page: page,lang: lang);
}