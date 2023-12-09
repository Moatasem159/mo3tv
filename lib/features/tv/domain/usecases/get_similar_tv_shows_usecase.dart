import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetSimilarTvShowsUseCase{
  final TvRepository _tvRepository;
  const GetSimilarTvShowsUseCase(this._tvRepository);
  Future<Either<Failure, List<TvShow>>> call(MediaParams params) async=> await _tvRepository.getSimilarTvShows(params);
}