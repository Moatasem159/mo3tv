import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';

class GetTvRecommendationsUseCase{
  final TvRepository tvRepository;

  GetTvRecommendationsUseCase({required this.tvRepository});

  Future<Either<Failure, List<TvShow>>> call({required int tvId,required int page}) async {
    return await tvRepository.getTvShowRecommendations(tvId: tvId, page: page);
  }
}