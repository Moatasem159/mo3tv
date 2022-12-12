import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/data/models/cast_model.dart';
import 'package:mo3tv/features/movies/data/models/gallery_model.dart';
import 'package:mo3tv/features/movies/data/models/keywords_model.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/data/models/message_model.dart';
import 'package:mo3tv/features/movies/data/models/review_model.dart';
import 'package:mo3tv/features/movies/data/models/video_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies({required int page});

  Future<List<MovieModel>> getPopularMovies({required int page});
  Future<MessageModel> rateMovie({required dynamic rate,required int movieId});
  Future<MessageModel> markMovieAsFavourite({required int movieId,required bool fav});
  Future<MessageModel> addMovieToWatchList({required int movieId,required bool watchList});
  Future<MessageModel> removeMovieFromFavourite({required int movieId});
  Future<MessageModel> deleteRateMovie({required int movieId});
  Future<List<MovieModel>> getTopRatedMovies({required int page});
  Future<MovieModel> getMovieDetails({required int movieId});
  Future<GalleryModel> getMovieGallery({required int movieId});
  Future<List<GenreModel>> getMovieKeywords({required int movieId});
  Future<List<ReviewModel>> getMovieReviews({required int movieId});
  Future<List<CastMemberModel>> getMovieCredits({required int movieId});
  Future<VideoModel> getMovieVideos({required int movieId});
  Future<List<MovieModel>> getMovieRecommendations({required int page,required int movieId});
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  MovieRemoteDataSourceImpl({required this.apiConsumer});
  ApiConsumer apiConsumer;
  /// Now Playing Movies
  @override
  Future<List<MovieModel>> getNowPlayingMovies({required int page}) async {
    final response = await apiConsumer.get(EndPoints.nowPlayingMoviesPath(page: page));
    return List<MovieModel>.from(
      (response['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }

  /// Popular Movies
  @override
  Future<List<MovieModel>> getPopularMovies({required int page}) async {
    final response = await apiConsumer.get(EndPoints.nowPopularMoviesPath(page:page ));

    return List<MovieModel>.from(
      (response['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }

  /// Top Rated Movies
  @override
  Future<List<MovieModel>> getTopRatedMovies({required int page}) async {
    final response = await apiConsumer.get(EndPoints.nowTopRatedMoviesPath(page:page ));

    return List<MovieModel>.from(
      (response['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }

  @override
  Future<MovieModel> getMovieDetails({required int movieId})async {
    final response = await apiConsumer.get(EndPoints.movieDetailsPath(movieId));

    return MovieModel.fromJson(response);
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations({required int page, required int movieId})async {
    final response = await apiConsumer.get(EndPoints.recommendationPath(movieId, page));
    return List<MovieModel>.from(
      (response['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }

  @override
  Future<VideoModel> getMovieVideos({required int movieId})async {
    final response = await apiConsumer.get(EndPoints.movieVideos(movieId));

    return VideoModel.fromJson(response);
  }

  @override
  Future<List<GenreModel>> getMovieKeywords({required int movieId})async {
    final response = await apiConsumer.get(EndPoints.movieKeywordsPath(movieId));

    return List<GenreModel>.from(
      (response['keywords'] as List).map(
            (x) => GenreModel.fromJson(x),
      ),
    );
  }

  @override
  Future<List<ReviewModel>> getMovieReviews({required int movieId}) async{
    final response = await apiConsumer.get(EndPoints.movieReviewsPath(movieId));

    return List<ReviewModel>.from(
      (response['results'] as List).map(
            (x) => ReviewModel.fromJson(x),
      ),
    );
  }

  @override
  Future<List<CastMemberModel>> getMovieCredits({required int movieId})async {
    final response = await apiConsumer.get(EndPoints.movieCreditsPath(movieId));

    return List<CastMemberModel>.from(
      (response['cast'] as List).map(
            (x) => CastMemberModel.fromJson(x),
      ),
    );
  }

  @override
  Future<GalleryModel> getMovieGallery({required int movieId}) async{
    final response = await apiConsumer.get(EndPoints.movieGalleryPath(movieId));

    return GalleryModel.fromJson(response);
  }

  @override
  Future<MessageModel> deleteRateMovie({required int movieId}) async{
    final response = await apiConsumer.delete(EndPoints.rateMoviePath(AppStrings.sessionId,movieId));
    return MessageModel.fromJson(response);
  }

  @override
  Future<MessageModel> rateMovie({required rate,required int movieId})async {
    final response = await apiConsumer.post(EndPoints.rateMoviePath(AppStrings.sessionId,movieId),
        body:{
          "value":rate,
    });
    return MessageModel.fromJson(response);
  }

  @override
  Future<MessageModel> markMovieAsFavourite({required int movieId,required bool fav})async {
    final response = await apiConsumer.post(EndPoints.favMoviePath(AppStrings.sessionId),
        body:{
          "media_type":"movie",
          "media_id": movieId,
          "favorite": fav
        });
    return MessageModel.fromJson(response);
  }

  @override
  Future<MessageModel> removeMovieFromFavourite({required int movieId}) {
    // TODO: implement removeMovieFromFavourite
    throw UnimplementedError();
  }

  @override
  Future<MessageModel> addMovieToWatchList({required int movieId, required bool watchList}) async{
    final response = await apiConsumer.post(EndPoints.addToWatchListPath(AppStrings.sessionId),
        body:{
          "media_type":"movie",
          "media_id": movieId,
          "watchlist": watchList
        });
    return MessageModel.fromJson(response);
  }
}