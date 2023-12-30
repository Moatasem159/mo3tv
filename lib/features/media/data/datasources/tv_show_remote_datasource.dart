import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/data/models/tv_show_model.dart';
import 'package:mo3tv/features/media/data/models/tv_show_season_model.dart';
abstract class TvShowRemoteDataSource {
  Future<TvShowModel> getTvShowDetails(MediaParams params);
  Future<TvShowSeasonModel> getTvShowSeasonDetails(MediaParams params);
}
class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource{
  final ApiConsumer _apiConsumer;
  const TvShowRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<TvShowModel> getTvShowDetails(MediaParams params)async=>
      TvShowModel.fromJson(await _apiConsumer.get(EndPoints.mediaDetailsPath(AppStrings.sessionId,params)));
  @override
  Future<TvShowSeasonModel> getTvShowSeasonDetails(MediaParams params) async=>
     TvShowSeasonModel.fromJson(await _apiConsumer.get(EndPoints.tvShowSeasonDetailsPath(params)));

}