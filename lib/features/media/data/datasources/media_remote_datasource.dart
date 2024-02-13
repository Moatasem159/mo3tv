import 'package:hive/hive.dart';
import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/models/message_model.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/data/models/media_model.dart';
abstract class MediaRemoteDataSource{
  Future<List<MediaModel>> getMediaList(MediaParams params);
  Future<List<MediaModel>> getSimilarMedia(MediaParams params);
  Future<MessageModel> rateMedia(MediaParams params);
  Future<MessageModel> deleteMediaRate(MediaParams params);
  Future<MessageModel> markMedia(MediaParams params);
  Future<List<MediaModel>> getDiscoverList(MediaParams params);
}
class MediaRemoteDataSourceImpl implements MediaRemoteDataSource{
  final ApiConsumer _apiConsumer;
  MediaRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<List<MediaModel>> getMediaList(MediaParams params)async {
    final dynamic response;
    if(params.listType!=AppStrings.trending) {
      response= await _apiConsumer.get(EndPoints.mediaListsPath(params));
    }
    else{
      response =await _apiConsumer.get(EndPoints.trendingMediaPath(params));
    }
    return List<MediaModel>.from((response['results'] as List).map((x)=> MediaModel.fromJson(x)))
      ..removeWhere((element) => element.backdropPath==''||element.posterPath=='');
  }
  @override
  Future<List<MediaModel>> getSimilarMedia(MediaParams params) async{
    final response = await _apiConsumer.get(EndPoints.similarMediaPath(params));
    return List<MediaModel>.from((response['results'] as List).map((x) => MediaModel.fromJson(x)))
      ..removeWhere((element) => element.backdropPath==''||element.posterPath=='');
  }
  @override
  Future<MessageModel> deleteMediaRate(MediaParams params) async=>
      MessageModel.fromJson(await _apiConsumer.delete(EndPoints.rateMediaPath(AppStrings.sessionId,params)));
  @override
  Future<MessageModel> rateMedia(MediaParams params)async =>
      MessageModel.fromJson(await _apiConsumer.post(EndPoints.rateMediaPath(AppStrings.sessionId,params), body:{"value":params.rate}));
  @override
  Future<MessageModel> markMedia(MediaParams params)async=>
      MessageModel.fromJson( await _apiConsumer.post(EndPoints.markMediaPath(AppStrings.sessionId,params.markType),
          body:{
            "media_type":params.mediaType,
            "media_id": params.mediaId,
            params.markType: params.mark
          }
      ));
  @override
  Future<List<MediaModel>> getDiscoverList(MediaParams params)async {
    String genres = await _getGenres(params.mediaType);
    final response = await _apiConsumer.get(EndPoints.discoverPath(MediaParams(
      mediaType: params.mediaType,
      lang: params.lang,
      page: params.page,
      genres: genres
    )));
    return List<MediaModel>.from((response['results'] as List).map((x) => MediaModel.fromJson(x)))
      ..removeWhere((element) => element.backdropPath==''||element.posterPath=='');
  }
  Future<String> _getGenres(String mediaType) async {
    String boxName=mediaType==AppStrings.movie?"movieGenres":"tvGenres";
    Box<String> mediaBox=await Hive.openBox<String>(boxName);
    List<String> list=mediaBox.values.toList();
    String genres=list.join(",");
    mediaBox.close();
    return genres;
  }
}