import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/credits/data/datasources/credits_data_source.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/features/credits/domain/repositories/credits_repository.dart';

class CreditsRepositoryImpl implements CreditsRepository {
  final BaseRepository _baseRepository;
  final CreditsDataSource _creditsDataSource;

  const CreditsRepositoryImpl(this._baseRepository, this._creditsDataSource);

  @override
  Future<ApiResult<List<CastMember>>> getMediaCredits(
      MediaParams params) async {
    return _baseRepository.execute<List<CastMember>>(
        () => _creditsDataSource.getMediaCredits(params));
  }
}