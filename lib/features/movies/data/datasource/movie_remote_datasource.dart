import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/core/models/message_model.dart';
import 'package:mo3tv/core/entities/media_params.dart';
abstract class MovieRemoteDataSource {
  Future<MovieModel> getMovieDetails(MediaParams params);
  Future<List<MovieModel>> getMoviesList(MediaParams params);
  Future<List<MovieModel>> getTrendingMovies(MediaParams params);
  Future<List<MovieModel>> getMovieRecommendations(MediaParams params);
  Future<List<MovieModel>> getSimilarMovies(MediaParams params);
  Future<MessageModel> rateMovie(MediaParams params);
  Future<MessageModel> deleteMovieRate(MediaParams params);
  Future<MessageModel> markMovie(MediaParams params);
}
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource{
  final ApiConsumer _apiConsumer;
  const MovieRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<MovieModel> getMovieDetails(MediaParams params)async{
    final dynamic response=await _apiConsumer.get(EndPoints.mediaDetailsPath(AppStrings.sessionId,params));
    return MovieModel.fromJson(response)..productionCompanies.removeWhere((e) =>e.logoPath=='');
  }
  @override
  Future<List<MovieModel>> getMoviesList(MediaParams params) async {
    final dynamic response = await _apiConsumer.get(EndPoints.mediaListsPath(params));
    return List<MovieModel>.from((response['results'] as List).map((x)=> MovieModel.fromJson(x)))
      ..removeWhere((element) => element.backdropPath==''||element.posterPath=='');
  }
  @override
  Future<List<MovieModel>> getTrendingMovies(MediaParams params) async{
    final response = await _apiConsumer.get(EndPoints.trendingMediaPath(params));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)))
      ..removeWhere((element) => element.backdropPath==''||element.posterPath=='');
  }
  @override
  Future<List<MovieModel>> getMovieRecommendations(MediaParams params)async {
    final response = await _apiConsumer.get(EndPoints.recommendationMediaPath(params));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)))
      ..removeWhere((element) => element.backdropPath==''||element.posterPath=='');
  }
  @override
  Future<List<MovieModel>> getSimilarMovies(MediaParams params)async {
    final response = await _apiConsumer.get(EndPoints.similarMediaPath(params));
    return List<MovieModel>.from((response['results'] as List).map((x) => MovieModel.fromJson(x)))
      ..removeWhere((element) => element.backdropPath==''||element.posterPath=='');
  }
  @override
  Future<MessageModel> deleteMovieRate(MediaParams params) async=>
   MessageModel.fromJson(await _apiConsumer.delete(EndPoints.rateMediaPath(AppStrings.sessionId,params)));
  @override
  Future<MessageModel> rateMovie(MediaParams params)async =>
      MessageModel.fromJson(await _apiConsumer.post(EndPoints.rateMediaPath(AppStrings.sessionId,params), body:{"value":params.rate}));
  @override
  Future<MessageModel> markMovie(MediaParams params)async=>
     MessageModel.fromJson( await _apiConsumer.post(EndPoints.markMediaPath(AppStrings.sessionId,params.markType),
        body:{
          "media_type":params.mediaType,
          "media_id": params.mediaId,
          params.markType: params.mark
        }
    ));
  }