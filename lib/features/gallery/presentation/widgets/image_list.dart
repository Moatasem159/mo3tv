part of'../screens/media_gallery_screen.dart';
class _ImageList extends StatelessWidget with ImageTypes {
  final List<ImageEntity>? images;
  final ImageType imageType;
  final String ?mediaType;
  final bool isLoading;
  const _ImageList({this.mediaType,this.images,required this.imageType,required this.isLoading});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:getHeight(context, imageType),
      child:ListView.builder(
        padding:EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width * 0.02),
        itemCount: images?.length??7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          if(!isLoading)
          {
            return _GalleryImage(imageType: imageType,mediaType: mediaType!,image: images![index],isLoading: isLoading);
          }
          return _GalleryImageLoading(imageType: imageType,isLoading: isLoading);
        },
      ),
    );
  }
}