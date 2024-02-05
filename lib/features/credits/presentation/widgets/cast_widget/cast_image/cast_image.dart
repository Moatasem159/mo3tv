part of'../../../screens/media_credits_screen.dart';
class CastImage extends StatelessWidget {
  final String image;
  const CastImage({super.key,required this.image});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: EndPoints.logoUrl(image),
      imageBuilder: (context, imageProvider) => CastImageBuilder(imageProvider: imageProvider),
      placeholder: (context, url) =>const CastImagePlaceholder(),
      errorWidget: (context, url, error) => const CastImagePlaceholder(),
    );
  }
}