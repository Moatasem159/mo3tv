import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';

abstract class TvRepository {
  Future<ApiResult<TvShow>> getTvShowDetails(MediaParams params);

  Future<ApiResult<TvShowSeason>> getTvShowSeasonDetails(MediaParams params);
}