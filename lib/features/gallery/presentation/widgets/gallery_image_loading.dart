part of'../screens/media_gallery_screen.dart';
class _GalleryImageLoading extends StatelessWidget with ImageTypes{
  final ImageType imageType;
  final bool isLoading;
  const _GalleryImageLoading({required this.imageType, required this.isLoading});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        margin:isLoading? const EdgeInsets.symmetric(horizontal: 5):null,
        width:getWidth(context,imageType),
        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}