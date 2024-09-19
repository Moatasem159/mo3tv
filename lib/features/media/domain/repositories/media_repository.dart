import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';

abstract class MediaRepository {
  Future<ApiResult<List<Media>>> getMediaList(MediaParams params);

  Future<ApiResult<List<Media>>> getSimilarMedia(MediaParams params);

  Future<ApiResult<Message>> rateMedia(MediaParams params);

  Future<ApiResult<Message>> deleteMediaRate(MediaParams params);

  Future<ApiResult<Message>> markMedia(MediaParams params);

  Future<ApiResult<List<Media>>> getDiscoverMediaList(MediaParams params);
}