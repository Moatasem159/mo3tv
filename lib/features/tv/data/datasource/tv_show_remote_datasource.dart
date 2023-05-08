import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/models/message_model.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/models/cast_model.dart';
import 'package:mo3tv/core/models/review_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_season_model.dart';
abstract class TvShowRemoteDataSource {
  Future<List<TvShowModel>> getNowPlayingTvShows({required int page});
  Future<List<TvShowModel>> getPopularTvShows({required int page});
  Future<List<TvShowModel>> getTrendingTvShows({required int page});
  Future<List<TvShowModel>> getTopRatedTvShows({required int page});
  Future<TvShowModel> getTvShowDetails({required int tvShowId});
  Future<TvShowSeasonModel> getTvShowSeasonDetails({required int tvShowId,required int seasonNumber});
  Future<List<TvShowModel>> getTvShowRecommendations({required int page,required int tvId});
  Future<List<ReviewModel>> getTvShowsReviews({required int tvId});
  Future<List<CastMemberModel>> getTvShowCredits({required int tvId});
  Future<MessageModel> markTvShowAsFavourite({required int tvId,required bool fav});
  Future<MessageModel> addTvShowToWatchList({required int tvId,required bool watchList});
  Future<MessageModel> rateTvShow({required dynamic rate,required int tvId});
  Future<MessageModel> deleteTvShowRate({required int tvId});
}
class TvShowRemoteDataSourceImpl extends TvShowRemoteDataSource{
  final ApiConsumer _apiConsumer;
  TvShowRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<List<TvShowModel>> getNowPlayingTvShows({required int page}) async{
    final response = await _apiConsumer.get(EndPoints.nowPlayingMediaPath(
        page: page, mediaType: AppStrings.tv, nowPlaying: "on_the_air"));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<List<TvShowModel>> getPopularTvShows({required int page})async {
    final response = await _apiConsumer.get(EndPoints.popularMediaPath(page: page,mediaType: AppStrings.tv));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<List<TvShowModel>> getTopRatedTvShows({required int page})async{
    final response = await _apiConsumer.get(EndPoints.topRatedMediaPath(page: page,mediaType: AppStrings.tv));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<TvShowModel> getTvShowDetails({required int tvShowId})async {
    final response = await _apiConsumer.get(EndPoints.mediaDetailsPath(tvShowId,AppStrings.sessionId,AppStrings.tv));
    return TvShowModel.fromJson(response);
  }
  @override
  Future<List<TvShowModel>> getTvShowRecommendations({required int page, required int tvId})async {
    final response = await _apiConsumer.get(EndPoints.recommendationMediaPath(tvId, page,AppStrings.tv));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<List<ReviewModel>> getTvShowsReviews({required int tvId})async {
    final response = await _apiConsumer.get(EndPoints.mediaReviewsPath(tvId,AppStrings.tv));
    return List<ReviewModel>.from((response['results'] as List).map((x) => ReviewModel.fromJson(x)));
  }
  @override
  Future<List<CastMemberModel>> getTvShowCredits({required int tvId})async {
    final response = await _apiConsumer.get(EndPoints.mediaCreditsPath(tvId,AppStrings.tv));
    return List<CastMemberModel>.from((response['cast'] as List).map((x) => CastMemberModel.fromJson(x)));
  }
  @override
  Future<MessageModel> markTvShowAsFavourite({required int tvId, required bool fav}) async{
    final response = await _apiConsumer.post(EndPoints.favMediaPath(AppStrings.sessionId),
        body:{
          "media_type":AppStrings.tv,
          "media_id": tvId,
          "favorite": fav
        });
    return MessageModel.fromJson(response);
  }
  @override
  Future<MessageModel> addTvShowToWatchList({required int tvId, required bool watchList})async {
    final response = await _apiConsumer.post(EndPoints.addMediaToWatchListPath(AppStrings.sessionId),
        body:{
          "media_type":AppStrings.tv,
          "media_id": tvId,
          "watchlist": watchList
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
  @override
  Future<List<TvShowModel>> getTrendingTvShows({required int page}) async{
    final response = await _apiConsumer.get(EndPoints.trendingMediaPath(page: page,mediaType: "tv"));
    return List<TvShowModel>.from((response['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<TvShowSeasonModel> getTvShowSeasonDetails({required int tvShowId, required int seasonNumber}) async{
    final response = await _apiConsumer.get(EndPoints.tvShowSeasonDetailsPath(tvShowId,seasonNumber));
    return TvShowSeasonModel.fromJson(response);
  }
}