import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/gallery/data/models/gallery_model.dart';
abstract class GalleryDataSource{
  Future<GalleryModel> getMediaGallery({required int mediaId,required String mediaType});
}
class GalleryDataSourceImpl implements GalleryDataSource{
  final ApiConsumer _apiConsumer;
  const GalleryDataSourceImpl(this._apiConsumer);
  @override
  Future<GalleryModel> getMediaGallery({required int mediaId,required String mediaType}) async{
    final response = await _apiConsumer.get(EndPoints.mediaGalleryPath(mediaId,mediaType));
    return GalleryModel.fromJson(response);
  }
}