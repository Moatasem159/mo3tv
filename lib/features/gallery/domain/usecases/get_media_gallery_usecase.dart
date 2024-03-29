import 'package:dartz/dartz.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
import 'package:mo3tv/features/gallery/domain/repositories/gallery_repository.dart';
class GetMediaGalleryUsecase{
  final GalleryRepository _galleryRepository;
  GetMediaGalleryUsecase(this._galleryRepository);
  Future<Either<Failure, Gallery>> call(MediaParams params) async=>await _galleryRepository.getMediaGallery(params);
}