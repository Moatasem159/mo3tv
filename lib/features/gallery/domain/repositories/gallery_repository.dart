import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';

abstract class GalleryRepository {
  Future<ApiResult<Gallery>> getMediaGallery(MediaParams params);
}