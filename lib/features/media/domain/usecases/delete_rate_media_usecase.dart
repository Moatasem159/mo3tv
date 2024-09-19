import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/media/domain/repositories/media_repository.dart';

class DeleteRateMediaUseCase {
  final MediaRepository _mediaRepository;

  const DeleteRateMediaUseCase(this._mediaRepository);

  Future<ApiResult<Message>> call(MediaParams params) async =>
      await _mediaRepository.deleteMediaRate(params);
}