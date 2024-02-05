part of'../../../screens/media_credits_screen.dart';
class _CastImage extends StatelessWidget {
  final String image;
  const _CastImage(this.image);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: EndPoints.logoUrl(image),
      imageBuilder: (context, imageProvider) => _CastImageBuilder(imageProvider),
      placeholder: (context, url) =>const _CastImagePlaceholder(),
      errorWidget: (context, url, error) => const _CastImagePlaceholder(),
    );
  }
}