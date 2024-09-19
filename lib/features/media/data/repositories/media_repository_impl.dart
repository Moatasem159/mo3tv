import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/media/data/datasources/media_remote_datasource.dart';
import 'package:mo3tv/features/media/domain/repositories/media_repository.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaRemoteDataSource _mediaRemoteDataSource;
  final BaseRepository _baseRepository;

  MediaRepositoryImpl(this._mediaRemoteDataSource, this._baseRepository);

  @override
  Future<ApiResult<List<Media>>> getMediaList(MediaParams params) async {
    return _baseRepository.execute<List<Media>>(
        () => _mediaRemoteDataSource.getMediaList(params));
  }

  @override
  Future<ApiResult<List<Media>>> getSimilarMedia(MediaParams params) async {
    return _baseRepository.execute<List<Media>>(
        () => _mediaRemoteDataSource.getSimilarMedia(params));
  }

  @override
  Future<ApiResult<Message>> deleteMediaRate(MediaParams params) async {
    return _baseRepository
        .execute<Message>(() => _mediaRemoteDataSource.deleteMediaRate(params));
  }

  @override
  Future<ApiResult<Message>> rateMedia(MediaParams params) async {
    return _baseRepository
        .execute<Message>(() => _mediaRemoteDataSource.rateMedia(params));
  }

  @override
  Future<ApiResult<Message>> markMedia(MediaParams params) async {
    return _baseRepository
        .execute<Message>(() => _mediaRemoteDataSource.markMedia(params));
  }

  @override
  Future<ApiResult<List<Media>>> getDiscoverMediaList(
      MediaParams params) async {
    return _baseRepository.execute<List<Media>>(
        () => _mediaRemoteDataSource.getDiscoverList(params));
  }
}