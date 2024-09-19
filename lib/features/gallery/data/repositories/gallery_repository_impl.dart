import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/gallery/data/datasources/gallery_datasource.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
import 'package:mo3tv/features/gallery/domain/repositories/gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryDataSource _galleryDataSource;
  final BaseRepository _baseRepository;

  const GalleryRepositoryImpl(this._baseRepository, this._galleryDataSource);

  @override
  Future<ApiResult<Gallery>> getMediaGallery(MediaParams params) async {
    return _baseRepository
        .execute<Gallery>(() => _galleryDataSource.getMediaGallery(params));
  }
}