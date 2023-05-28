import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/models/message_model.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_season_model.dart';
abstract class TvShowRemoteDataSource {
  Future<List<TvShowModel>> getTvShowsList({required int page,required String listType,required String lang});
  Future<List<TvShowModel>> getTrendingTvShows({required int page,required String lang});
  Future<TvShowModel> getTvShowDetails({required int tvShowId,required String lang});
  Future<TvShowSeasonModel> getTvShowSeasonDetails({required int tvShowId,required int seasonNumber,required String lang});
  Future<List<TvShowModel>> getTvShowRecommendations({required int tvId,required String lang});
  Future<List<TvShowModel>> getSimilarTvShows({required int tvId,required int page,required String lang});
  Future<MessageModel> markTvShow({required int tvId,required bool mark,required String markType});
  Future<MessageModel> rateTvShow({required dynamic rate,required int tvId});
  Future<MessageModel> deleteTvShowRate({required int tvId});
}
class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource{
  final ApiConsumer _apiConsumer;
  TvShowRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<List<TvShowModel>> getTvShowsList({required int page,required String listType,required String lang}) async{
    final response = await _apiConsumer.get(EndPoints.mediaListsPath(AppStrings.tv,listType,page,lang));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<List<TvShowModel>> getTrendingTvShows({required int page,required String lang}) async{
    final response = await _apiConsumer.get(EndPoints.trendingMediaPath(page: page,mediaType: "tv",lang: lang));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<TvShowModel> getTvShowDetails({required int tvShowId,required String lang})async {
    final response = await _apiConsumer.get(EndPoints.mediaDetailsPath(tvShowId,AppStrings.sessionId,AppStrings.tv,lang));
    return TvShowModel.fromJson(response);
  }
  @override
  Future<List<TvShowModel>> getTvShowRecommendations({required int tvId,required String lang})async {
    final response = await _apiConsumer.get(EndPoints.recommendationMediaPath(tvId,AppStrings.tv,lang));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<List<TvShowModel>> getSimilarTvShows({required int tvId, required int page,required String lang})async {
    final response = await _apiConsumer.get(EndPoints.similarMediaPath(tvId,page,AppStrings.tv,lang));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<TvShowSeasonModel> getTvShowSeasonDetails({required int tvShowId, required int seasonNumber,required String lang}) async{
    final response = await _apiConsumer.get(EndPoints.tvShowSeasonDetailsPath(tvShowId,seasonNumber,lang));
    return TvShowSeasonModel.fromJson(response);
  }
  @override
  Future<MessageModel> markTvShow({required int tvId, required bool mark,required String markType}) async{
    final response = await _apiConsumer.post(EndPoints.markMediaPath(AppStrings.sessionId,markType),
        body:{
          "media_type":AppStrings.tv,
          "media_id": tvId,
          markType: mark
        });
    return MessageModel.fromJson(response);
  }
  @override
  Future<MessageModel> deleteTvShowRate({required int tvId})async{
    final response = await _apiConsumer.delete(EndPoints.rateMediaPath(AppStrings.sessionId,tvId,AppStrings.tv));
    return MessageModel.fromJson(response);
  }
  @override
  Future<MessageModel> rateTvShow({required rate, required int tvId}) async{
    final response = await _apiConsumer.post(EndPoints.rateMediaPath(AppStrings.sessionId,tvId,AppStrings.tv),
        body:{
          "value":rate,
        });
    return MessageModel.fromJson(response);
  }
}