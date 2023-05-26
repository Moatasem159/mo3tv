import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/core/models/message_model.dart';
abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMoviesList({required int page,required String listType});
  Future<List<MovieModel>> getTrendingMovies({required int page});
  Future<MessageModel> rateMovie({required dynamic rate,required int movieId});
  Future<MessageModel> markMovie({required int movieId,required bool mark,required String markType});
  Future<MessageModel> deleteMovieRate({required int movieId});
  Future<MovieModel> getMovieDetails({required int movieId});
  Future<List<MovieModel>> getMovieRecommendations({required int movieId});
  Future<List<MovieModel>> getSimilarMovies({required int movieId,required int page});
}
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiConsumer _apiConsumer;
  MovieRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<List<MovieModel>> getMoviesList({required int page,required String listType}) async {
    final response = await _apiConsumer.get(EndPoints.mediaListsPath(AppStrings.movie,listType,page));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)));
  }
  @override
  Future<List<MovieModel>> getTrendingMovies({required int page}) async{
    final response = await _apiConsumer.get(EndPoints.trendingMediaPath(page:page,mediaType:AppStrings.movie));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)));
  }
  @override
  Future<MovieModel> getMovieDetails({required int movieId})async {
    final response = await _apiConsumer.get(EndPoints.mediaDetailsPath(movieId,AppStrings.sessionId,AppStrings.movie));
    return MovieModel.fromJson(response);
  }
  @override
  Future<List<MovieModel>> getMovieRecommendations({required int movieId})async {
    final response = await _apiConsumer.get(EndPoints.recommendationMediaPath(movieId,AppStrings.movie));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)));
  }
  @override
  Future<List<MovieModel>> getSimilarMovies({required int movieId, required int page})async {
    final response = await _apiConsumer.get(EndPoints.similarMediaPath(movieId,page,AppStrings.movie));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)));
  }
  @override
  Future<MessageModel> deleteMovieRate({required int movieId}) async{
    final response = await _apiConsumer.delete(EndPoints.rateMediaPath(AppStrings.sessionId,movieId,AppStrings.movie));
    return MessageModel.fromJson(response);
  }
  @override
  Future<MessageModel> rateMovie({required rate,required int movieId})async {
    final response = await _apiConsumer.post(EndPoints.rateMediaPath(AppStrings.sessionId,movieId,AppStrings.movie),
        body:{
          "value":rate,
    });
    return MessageModel.fromJson(response);
  }
  @override
  Future<MessageModel> markMovie({required int movieId,required bool mark,required String markType})async {
    final response = await _apiConsumer.post(EndPoints.markMediaPath(AppStrings.sessionId,markType),
        body:{
          "media_type":AppStrings.movie,
          "media_id": movieId,
           markType: mark
        }
        );
    return MessageModel.fromJson(response);
  }
}