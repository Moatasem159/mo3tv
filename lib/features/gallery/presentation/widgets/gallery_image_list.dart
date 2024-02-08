part of'../screens/media_gallery_screen.dart';
class _GalleryImageList extends StatelessWidget with ImageTypes{
  final List<ImageEntity>? images;
  final ImageType imageType;
  final String ?mediaType;
  final bool isLoading;
  const _GalleryImageList({this.mediaType,this.images,required this.imageType,required this.isLoading});
  @override
  Widget build(BuildContext context) {
    if(images==null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ImageListTitle(length:0,title: getTitle(imageType)),
          _ImageList(imageType:imageType,isLoading:isLoading),
        ],
      );
    }
    if(images!=null&&images!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ImageListTitle(length:images!.length,title: getTitle(imageType)),
          _ImageList(images: images,mediaType: mediaType,imageType:imageType,isLoading:isLoading),
        ],
      );
    }
    return const SizedBox();
  }
}