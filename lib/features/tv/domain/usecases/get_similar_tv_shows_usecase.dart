import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetSimilarTvShowsUseCase{
  final TvRepository _tvRepository;
  GetSimilarTvShowsUseCase(this._tvRepository);
  Future<Either<Failure, List<TvShow>>> call({required int tvId,required int page}) async {
    return await _tvRepository.getSimilarTvShows(tvId: tvId,page: page);
  }
}