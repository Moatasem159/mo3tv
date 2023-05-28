import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetTvRecommendationsUseCase{
  final TvRepository _tvRepository;
  GetTvRecommendationsUseCase(this._tvRepository);
  Future<Either<Failure, List<TvShow>>> call({required int tvId,required String lang}) async {
    return await _tvRepository.getTvShowRecommendations(tvId: tvId,lang: lang);
  }
}