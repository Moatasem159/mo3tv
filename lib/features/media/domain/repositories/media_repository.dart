import 'package:dartz/dartz.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
abstract class MediaRepository{
  Future<Either<Failure,List<Media>>> getMediaList(MediaParams params);
  Future<Either<Failure,List<Media>>> getSimilarMedia(MediaParams params);
  Future<Either<Failure,Message>> rateMedia(MediaParams params);
  Future<Either<Failure,Message>> deleteMediaRate(MediaParams params);
  Future<Either<Failure,Message>> markMedia(MediaParams params);
}