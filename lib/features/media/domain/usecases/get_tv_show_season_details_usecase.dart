import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/media/domain/repositories/tv_repository.dart';

class GetTvShowSeasonDetailsUsecase {
  final TvRepository _tvRepository;

  const GetTvShowSeasonDetailsUsecase(this._tvRepository);

  Future<ApiResult<TvShowSeason>> call(MediaParams params) async =>
      await _tvRepository.getTvShowSeasonDetails(params);
}