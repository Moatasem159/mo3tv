part of'../screens/media_gallery_screen.dart';
class _GalleryImage extends StatelessWidget with ImageTypes {
  final ImageEntity image;
  final String mediaType;
  final ImageType imageType;
  final bool isLoading;
  const _GalleryImage({required this.image, required this.mediaType, required this.imageType, required this.isLoading});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
          mediaType == AppStrings.movie
              ? Routes.movieImageScreenRoute
              : Routes.tvShowImageScreenRoute,
          pathParameters: {"image": image.filePath}),
      child: Hero(
        tag: image.filePath,
        child:CachedNetworkImage(
            width: getWidth(context, imageType),
            imageUrl: EndPoints.posterUrl(image.filePath),
            imageBuilder: (_, imageProvider) {
              return Container(
                width: getWidth(context, imageType),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: imageType==ImageType.logos?BoxFit.contain:BoxFit.cover,
                    )),
              );
            },
            placeholder: (context, url) => _GalleryImageLoading(imageType: imageType,isLoading:isLoading),
        ),
      ).addSymmetricPadding(h: 5),
    );
  }
}