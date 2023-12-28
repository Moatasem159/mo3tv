import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/models/message_model.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_season_model.dart';
abstract class TvShowRemoteDataSource {
  Future<List<TvShowModel>> getTvShowsList(MediaParams params);
  Future<TvShowModel> getTvShowDetails(MediaParams params);
  Future<TvShowSeasonModel> getTvShowSeasonDetails(MediaParams params);
  Future<List<TvShowModel>> getTvShowRecommendations(MediaParams params);
  Future<List<TvShowModel>> getSimilarTvShows(MediaParams params);
  Future<MessageModel> markTvShow(MediaParams params);
  Future<MessageModel> rateTvShow(MediaParams params);
  Future<MessageModel> deleteTvShowRate(MediaParams params);
}
class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource{
  final ApiConsumer _apiConsumer;
  const TvShowRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<TvShowModel> getTvShowDetails(MediaParams params)async=>
      TvShowModel.fromJson(await _apiConsumer.get(EndPoints.mediaDetailsPath(AppStrings.sessionId,params)));
  @override
  Future<List<TvShowModel>> getTvShowsList(MediaParams params) async{
    final dynamic response;
    if(params.listType!=AppStrings.trending)
      {
        response=await _apiConsumer.get(EndPoints.mediaListsPath(params));
      }
   else{
     response= await _apiConsumer.get(EndPoints.trendingMediaPath(params));
    }
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)))
      ..removeWhere((e) =>e.backdropPath==''||e.posterPath=='');
  }
  @override
  Future<List<TvShowModel>> getTvShowRecommendations(MediaParams params)async {
    final response = await _apiConsumer.get(EndPoints.recommendationMediaPath(params));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)))
      ..removeWhere((e) =>e.backdropPath==''||e.posterPath=='');
  }
  @override
  Future<List<TvShowModel>> getSimilarTvShows(MediaParams params)async {
    final response = await _apiConsumer.get(EndPoints.similarMediaPath(params));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)))
      ..removeWhere((e) =>e.backdropPath==''||e.posterPath=='');
  }
  @override
  Future<TvShowSeasonModel> getTvShowSeasonDetails(MediaParams params) async=>
     TvShowSeasonModel.fromJson(await _apiConsumer.get(EndPoints.tvShowSeasonDetailsPath(params)));
  @override
  Future<MessageModel> deleteTvShowRate(MediaParams params)async=>
    MessageModel.fromJson(await _apiConsumer.delete(EndPoints.rateMediaPath(AppStrings.sessionId,params)));
  @override
  Future<MessageModel> rateTvShow(MediaParams params) async=>
     MessageModel.fromJson(await _apiConsumer.post(EndPoints.rateMediaPath(AppStrings.sessionId,params),body:{"value":params.rate}));
  @override
  Future<MessageModel> markTvShow(MediaParams params) async=>
      MessageModel.fromJson(await _apiConsumer.post(EndPoints.markMediaPath(AppStrings.sessionId,params.markType),
          body:{
            "media_type":params.mediaType,
            "media_id": params.mediaId,
            params.markType: params.mark
          }));
}