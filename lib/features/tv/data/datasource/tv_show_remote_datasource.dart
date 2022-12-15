import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/models/message_model.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/models/cast_model.dart';
import 'package:mo3tv/core/models/gallery_model.dart';
import 'package:mo3tv/core/models/review_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';

abstract class TvShowRemoteDataSource {
  Future<List<TvShowModel>> getNowPlayingTvShows({required int page});
  Future<List<TvShowModel>> getPopularTvShows({required int page});
  Future<List<TvShowModel>> getTopRatedTvShows({required int page});
  Future<TvShowModel> getTvShowDetails({required int tvShowId});
  Future<List<TvShowModel>> getTvShowRecommendations({required int page,required int tvId});
  Future<List<ReviewModel>> getTvShowsReviews({required int tvId});
  Future<List<CastMemberModel>> getTvShowCredits({required int tvId});
  Future<GalleryModel> getTvShowGallery({required int tvId});
  Future<MessageModel> markTvShowAsFavourite({required int tvId,required bool fav});
  Future<MessageModel> addTvShowToWatchList({required int tvId,required bool watchList});
  Future<MessageModel> rateTvShow({required dynamic rate,required int tvId});
  Future<MessageModel> deleteTvShowRate({required int tvId});

}

class TvShowRemoteDataSourceImpl extends TvShowRemoteDataSource{

  ApiConsumer apiConsumer;

  TvShowRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<TvShowModel>> getNowPlayingTvShows({required int page}) async{
    final response = await apiConsumer.get(EndPoints.nowPlayingMediaPath(
        page: page, mediaType: "tv", nowPlaying: "on_the_air"));
    return List<TvShowModel>.from(
      (response['results'] as List).map(
            (x) => TvShowModel.fromJson(x),
      ),
    );
  }

  @override
  Future<List<TvShowModel>> getPopularTvShows({required int page})async {
    final response = await apiConsumer.get(EndPoints.popularMediaPath(page: page,mediaType: "tv"));
    return List<TvShowModel>.from(
      (response['results'] as List).map(
            (x) => TvShowModel.fromJson(x),
      ),
    );
  }

  @override
  Future<List<TvShowModel>> getTopRatedTvShows({required int page})async{
    final response = await apiConsumer.get(EndPoints.topRatedMediaPath(page: page,mediaType: "tv"));
    return List<TvShowModel>.from(
      (response['results'] as List).map(
            (x) => TvShowModel.fromJson(x),
      ),
    );
  }

  @override
  Future<TvShowModel> getTvShowDetails({required int tvShowId})async {
    final response = await apiConsumer.get(EndPoints.mediaDetailsPath(tvShowId,AppStrings.sessionId,"tv"));
    return TvShowModel.fromJson(response);
  }

  @override
  Future<List<TvShowModel>> getTvShowRecommendations({required int page, required int tvId})async {
    final response = await apiConsumer.get(EndPoints.recommendationMediaPath(tvId, page,"tv"));
    return List<TvShowModel>.from(
      (response['results'] as List).map(
            (x) => TvShowModel.fromJson(x),
      ),
    );
  }

  @override
  Future<List<ReviewModel>> getTvShowsReviews({required int tvId})async {
    final response = await apiConsumer.get(EndPoints.mediaReviewsPath(tvId,"tv"));
    return List<ReviewModel>.from(
      (response['results'] as List).map(
            (x) => ReviewModel.fromJson(x),
      ),
    );
  }

  @override
  Future<List<CastMemberModel>> getTvShowCredits({required int tvId})async {
    final response = await apiConsumer.get(EndPoints.mediaCreditsPath(tvId,"tv"));
    return List<CastMemberModel>.from(
      (response['cast'] as List).map(
            (x) => CastMemberModel.fromJson(x),
      ),
    );
  }

  @override
  Future<GalleryModel> getTvShowGallery({required int tvId})async {
    final response = await apiConsumer.get(EndPoints.mediaGalleryPath(tvId,"tv"));
    return GalleryModel.fromJson(response);
  }

  @override
  Future<MessageModel> markTvShowAsFavourite({required int tvId, required bool fav}) async{
    final response = await apiConsumer.post(EndPoints.favMediaPath(AppStrings.sessionId),
        body:{
          "media_type":"tv",
          "media_id": tvId,
          "favorite": fav
        });
    return MessageModel.fromJson(response);
  }

  @override
  Future<MessageModel> addTvShowToWatchList({required int tvId, required bool watchList})async {
    final response = await apiConsumer.post(EndPoints.addMediaToWatchListPath(AppStrings.sessionId),
        body:{
          "media_type":"tv",
          "media_id": tvId,
          "watchlist": watchList
        });
    return MessageModel.fromJson(response);
  }

  @override
  Future<MessageModel> deleteTvShowRate({required int tvId})async{
    final response = await apiConsumer.delete(EndPoints.rateMediaPath(AppStrings.sessionId,tvId,"tv"));
    return MessageModel.fromJson(response);
  }

  @override
  Future<MessageModel> rateTvShow({required rate, required int tvId}) async{
    final response = await apiConsumer.post(EndPoints.rateMediaPath(AppStrings.sessionId,tvId,"tv"),
        body:{
          "value":rate,
        });
    return MessageModel.fromJson(response);
  }
}