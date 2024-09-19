import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/domain/repositories/media_repository.dart';

class GetMediaListUsecase {
  final MediaRepository _mediaRepository;

  const GetMediaListUsecase(this._mediaRepository);

  Future<ApiResult<List<Media>>> call(MediaParams params) async =>
      await _mediaRepository.getMediaList(params);
}