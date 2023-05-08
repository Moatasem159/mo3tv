import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
abstract class GalleryRepository{
  Future<Either<Failure,Gallery>> getMediaGallery({required int mediaId,required String mediaType});
}