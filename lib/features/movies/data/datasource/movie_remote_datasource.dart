import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/core/models/message_model.dart';
abstract class MovieRemoteDataSource {
  Future<MovieModel> getMovieDetails({required int movieId,required String lang});
  Future<List<MovieModel>> getMoviesList({required int page,required String listType,required String lang});
  Future<List<MovieModel>> getTrendingMovies({required int page,required String lang});
  Future<MessageModel> rateMovie({required dynamic rate,required int movieId});
  Future<MessageModel> markMovie({required int movieId,required bool mark,required String markType});
  Future<MessageModel> deleteMovieRate({required int movieId});
  Future<List<MovieModel>> getMovieRecommendations({required int movieId,required String lang});
  Future<List<MovieModel>> getSimilarMovies({required int movieId,required int page,required String lang});
}
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource{
  final ApiConsumer _apiConsumer;
  const MovieRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<MovieModel> getMovieDetails({required int movieId,required String lang})async =>
      MovieModel.fromJson(await _apiConsumer.get(EndPoints.mediaDetailsPath(movieId,AppStrings.sessionId,AppStrings.movie,lang)));
  @override
  Future<List<MovieModel>> getMovieRecommendations({required int movieId,required String lang})async {
    final response = await _apiConsumer.get(EndPoints.recommendationMediaPath(movieId,AppStrings.movie,lang));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)));
  }
  @override
  Future<List<MovieModel>> getMoviesList({required int page,required String listType,required String lang}) async {
    final response = await _apiConsumer.get(EndPoints.mediaListsPath(AppStrings.movie,listType,page,lang));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)));
  }
  @override
  Future<List<MovieModel>> getTrendingMovies({required int page,required String lang}) async{
    final response = await _apiConsumer.get(EndPoints.trendingMediaPath(page:page,mediaType:AppStrings.movie,lang: lang));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)));
  }
  @override
  Future<List<MovieModel>> getSimilarMovies({required int movieId, required int page,required String lang})async {
    final response = await _apiConsumer.get(EndPoints.similarMediaPath(movieId,page,AppStrings.movie,lang));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)));
  }
  @override
  Future<MessageModel> deleteMovieRate({required int movieId}) async=>
   MessageModel.fromJson( await _apiConsumer.delete(EndPoints.rateMediaPath(AppStrings.sessionId,movieId,AppStrings.movie)));
  @override
  Future<MessageModel> rateMovie({required rate,required int movieId})async =>
     MessageModel.fromJson(await _apiConsumer.post(EndPoints.rateMediaPath(AppStrings.sessionId,movieId,AppStrings.movie),
        body:{
          "value":rate,
        }),
     );
  @override
  Future<MessageModel> markMovie({required int movieId,required bool mark,required String markType})async=>
     MessageModel.fromJson( await _apiConsumer.post(EndPoints.markMediaPath(AppStrings.sessionId,markType),
        body:{
          "media_type":AppStrings.movie,
          "media_id": movieId,
          markType: mark
        }
    ));
  }