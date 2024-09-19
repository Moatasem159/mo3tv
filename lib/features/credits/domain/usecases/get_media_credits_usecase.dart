import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/features/credits/domain/repositories/credits_repository.dart';

class GetMediaCreditsUsecase {
  final CreditsRepository _creditsRepository;

  const GetMediaCreditsUsecase(this._creditsRepository);

  Future<ApiResult<List<CastMember>>> call(MediaParams params) async =>
      await _creditsRepository.getMediaCredits(params);
}