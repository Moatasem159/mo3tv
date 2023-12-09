import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/features/gallery/data/models/gallery_model.dart';
abstract class GalleryDataSource{
  Future<GalleryModel> getMediaGallery(MediaParams params);
}
class GalleryDataSourceImpl implements GalleryDataSource{
  final ApiConsumer _apiConsumer;
  const GalleryDataSourceImpl(this._apiConsumer);
  @override
  Future<GalleryModel> getMediaGallery(MediaParams params) async{
    final response = await _apiConsumer.get(EndPoints.mediaGalleryPath(params));
    return GalleryModel.fromJson(response);
  }
}