import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/models/cast_model.dart';
import 'package:mo3tv/core/models/gallery_model.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/core/models/message_model.dart';
import 'package:mo3tv/core/models/review_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies({required int page});
  Future<List<MovieModel>> getPopularMovies({required int page});
  Future<List<MovieModel>> getTrendingMovies({required int page});
  Future<MessageModel> rateMovie({required dynamic rate,required int movieId});
  Future<MessageModel> markMovieAsFavourite({required int movieId,required bool fav});
  Future<MessageModel> addMovieToWatchList({required int movieId,required bool watchList});
  Future<MessageModel> deleteMovieRate({required int movieId});
  Future<List<MovieModel>> getTopRatedMovies({required int page});
  Future<MovieModel> getMovieDetails({required int movieId});
  Future<GalleryModel> getMovieGallery({required int movieId});
  Future<List<ReviewModel>> getMovieReviews({required int movieId});
  Future<List<CastMemberModel>> getMovieCredits({required int movieId});
  Future<List<MovieModel>> getMovieRecommendations({required int page,required int movieId});
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  MovieRemoteDataSourceImpl({required this.apiConsumer});
  ApiConsumer apiConsumer;
  /// Now Playing Movies
  @override
  Future<List<MovieModel>> getNowPlayingMovies({required int page}) async {
    final response = await apiConsumer.get(EndPoints.nowPlayingMediaPath(
        page: page, mediaType: AppStrings.movie, nowPlaying: "now_playing"));
    return List<MovieModel>.from(
      (response['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }

  /// Popular Movies
  @override
  Future<List<MovieModel>> getPopularMovies({required int page}) async {
    final response = await apiConsumer.get(EndPoints.popularMediaPath(page:page,mediaType:AppStrings.movie));

    return List<MovieModel>.from(
      (response['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }

  /// Top Rated Movies
  @override
  Future<List<MovieModel>> getTopRatedMovies({required int page}) async {
    final response = await apiConsumer.get(EndPoints.topRatedMediaPath(page:page,mediaType:AppStrings.movie));

    return List<MovieModel>.from(
      (response['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }

  @override
  Future<MovieModel> getMovieDetails({required int movieId})async {
    final response = await apiConsumer.get(EndPoints.mediaDetailsPath(movieId,AppStrings.sessionId,AppStrings.movie));

    return MovieModel.fromJson(response);
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations({required int page, required int movieId})async {
    final response = await apiConsumer.get(EndPoints.recommendationMediaPath(movieId, page,AppStrings.movie));
    return List<MovieModel>.from(
      (response['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }
  @override
  Future<List<ReviewModel>> getMovieReviews({required int movieId}) async{
    final response = await apiConsumer.get(EndPoints.mediaReviewsPath(movieId,AppStrings.movie));

    return List<ReviewModel>.from(
      (response['results'] as List).map(
            (x) => ReviewModel.fromJson(x),
      ),
    );
  }

  @override
  Future<List<CastMemberModel>> getMovieCredits({required int movieId})async {
    final response = await apiConsumer.get(EndPoints.mediaCreditsPath(movieId,AppStrings.movie));
    return List<CastMemberModel>.from(
      (response['cast'] as List).map(
            (x) => CastMemberModel.fromJson(x),
      ),
    );
  }

  @override
  Future<GalleryModel> getMovieGallery({required int movieId}) async{
    final response = await apiConsumer.get(EndPoints.mediaGalleryPath(movieId,AppStrings.movie));

    return GalleryModel.fromJson(response);
  }

  @override
  Future<MessageModel> deleteMovieRate({required int movieId}) async{
    final response = await apiConsumer.delete(EndPoints.rateMediaPath(AppStrings.sessionId,movieId,AppStrings.movie));
    return MessageModel.fromJson(response);
  }

  @override
  Future<MessageModel> rateMovie({required rate,required int movieId})async {
    final response = await apiConsumer.post(EndPoints.rateMediaPath(AppStrings.sessionId,movieId,AppStrings.movie),
        body:{
          "value":rate,
    });
    return MessageModel.fromJson(response);
  }

  @override
  Future<MessageModel> markMovieAsFavourite({required int movieId,required bool fav})async {
    final response = await apiConsumer.post(EndPoints.favMediaPath(AppStrings.sessionId),
        body:{
          "media_type":AppStrings.movie,
          "media_id": movieId,
          "favorite": fav
        });
    return MessageModel.fromJson(response);
  }
  @override
  Future<MessageModel> addMovieToWatchList({required int movieId, required bool watchList}) async{
    final response = await apiConsumer.post(EndPoints.addMediaToWatchListPath(AppStrings.sessionId),
        body:{
          "media_type":AppStrings.movie,
          "media_id": movieId,
          "watchlist": watchList
        });
    return MessageModel.fromJson(response);
  }

  @override
  Future<List<MovieModel>> getTrendingMovies({required int page}) async{
    final response = await apiConsumer.get(EndPoints.trendingMediaPath(page:page,mediaType:AppStrings.movie));
    return List<MovieModel>.from(
      (response['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }
}