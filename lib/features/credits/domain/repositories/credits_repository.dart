import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';

abstract class CreditsRepository {
  Future<ApiResult<List<CastMember>>> getMediaCredits(MediaParams params);
}