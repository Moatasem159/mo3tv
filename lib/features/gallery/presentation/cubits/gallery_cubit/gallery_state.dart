import 'package:mo3tv/features/gallery/domain/entities/gallery.dart';
abstract class GalleryStates {}
class GalleryInitialState extends GalleryStates {}
class GetMediaGalleryLoadingState extends GalleryStates{}
class GetMediaGallerySuccessState extends GalleryStates{
  final Gallery gallery;
  GetMediaGallerySuccessState(this.gallery);
}
class GetMediaGalleryErrorState extends GalleryStates{
  final String msg;
  GetMediaGalleryErrorState({required this.msg});
}