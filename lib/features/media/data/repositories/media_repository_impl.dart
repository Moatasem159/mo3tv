import 'package:dartz/dartz.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/execute_and_handle_errors.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/media/data/datasources/media_remote_datasource.dart';
import 'package:mo3tv/features/media/domain/repositories/media_repository.dart';
class MediaRepositoryImpl implements MediaRepository{
  final MediaRemoteDataSource _mediaRemoteDataSource;
  final NetworkInfo _networkInfo;
  MediaRepositoryImpl(this._mediaRemoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, List<Media>>> getMediaList(MediaParams params)async {
    return executeAndHandleError<List<Media>>(() => _mediaRemoteDataSource.getMediaList(params),_networkInfo);
  }
  @override
  Future<Either<Failure,List<Media>>> getSimilarMedia(MediaParams params) async{
    return executeAndHandleError<List<Media>>(() => _mediaRemoteDataSource.getSimilarMedia(params),_networkInfo);
  }
  @override
  Future<Either<Failure,Message>> deleteMediaRate(MediaParams params)async {
    return executeAndHandleError<Message>(() => _mediaRemoteDataSource.deleteMediaRate(params),_networkInfo);
  }
  @override
  Future<Either<Failure,Message>> rateMedia(MediaParams params)async {
    return executeAndHandleError<Message>(() => _mediaRemoteDataSource.rateMedia(params),_networkInfo);
  }
  @override
  Future<Either<Failure,Message>> markMedia(MediaParams params)async {
    return executeAndHandleError<Message>(() => _mediaRemoteDataSource.markMedia(params),_networkInfo);
  }
}