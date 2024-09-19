import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/media/domain/repositories/media_repository.dart';

class MarkMediaUsecase {
  final MediaRepository _mediaRepository;

  const MarkMediaUsecase(this._mediaRepository);

  Future<ApiResult<Message>> call(MediaParams params) async =>
      await _mediaRepository.markMedia(params);
}