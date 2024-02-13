import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/media/data/datasources/media_remote_datasource.dart';
import 'package:mo3tv/features/media/domain/repositories/media_repository.dart';
class MediaRepositoryImpl implements MediaRepository{
  final MediaRemoteDataSource _mediaRemoteDataSource;
  final BaseRepository _baseRepository;
  MediaRepositoryImpl(this._mediaRemoteDataSource, this._baseRepository);
  @override
  Future<Either<Failure, List<Media>>> getMediaList(MediaParams params)async {
    return _baseRepository.execute<List<Media>>(() => _mediaRemoteDataSource.getMediaList(params));
  }
  @override
  Future<Either<Failure,List<Media>>> getSimilarMedia(MediaParams params) async{
    return _baseRepository.execute<List<Media>>(() => _mediaRemoteDataSource.getSimilarMedia(params));
  }
  @override
  Future<Either<Failure,Message>> deleteMediaRate(MediaParams params)async {
    return _baseRepository.execute<Message>(() => _mediaRemoteDataSource.deleteMediaRate(params));
  }
  @override
  Future<Either<Failure,Message>> rateMedia(MediaParams params)async {
    return _baseRepository.execute<Message>(() => _mediaRemoteDataSource.rateMedia(params));
  }
  @override
  Future<Either<Failure,Message>> markMedia(MediaParams params)async {
    return _baseRepository.execute<Message>(() => _mediaRemoteDataSource.markMedia(params));
  }
  @override
  Future<Either<Failure, List<Media>>> getDiscoverMediaList(MediaParams params) async{
    return _baseRepository.execute<List<Media>>(() => _mediaRemoteDataSource.getDiscoverList(params));
  }
}