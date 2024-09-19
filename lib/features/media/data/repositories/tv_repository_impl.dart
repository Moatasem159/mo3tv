import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/data/datasources/tv_show_remote_datasource.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/media/domain/repositories/tv_repository.dart';

class TvShowRepositoryImpl implements TvRepository {
  final TvShowRemoteDataSource _tvShowRemoteDataSource;
  final BaseRepository _baseRepository;

  const TvShowRepositoryImpl(
      this._tvShowRemoteDataSource, this._baseRepository);

  @override
  Future<ApiResult<TvShow>> getTvShowDetails(MediaParams params) async {
    return _baseRepository.execute<TvShow>(
        () => _tvShowRemoteDataSource.getTvShowDetails(params));
  }

  @override
  Future<ApiResult<TvShowSeason>> getTvShowSeasonDetails(
      MediaParams params) async {
    return _baseRepository.execute<TvShowSeason>(
        () => _tvShowRemoteDataSource.getTvShowSeasonDetails(params));
  }
}