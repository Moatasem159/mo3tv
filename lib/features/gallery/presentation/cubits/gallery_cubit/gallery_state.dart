part of'gallery_cubit.dart';
abstract class GalleryStates {}
class GetMediaGalleryLoadingState extends GalleryStates{}
class GetMediaGallerySuccessState extends GalleryStates{
  final Gallery gallery;
  GetMediaGallerySuccessState(this.gallery);
}
class GetMediaGalleryErrorState extends GalleryStates{
  final String msg;
  GetMediaGalleryErrorState({required this.msg});
}