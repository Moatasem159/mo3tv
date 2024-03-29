import 'package:dartz/dartz.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
abstract class GalleryRepository{
  Future<Either<Failure,Gallery>> getMediaGallery(MediaParams params);
}