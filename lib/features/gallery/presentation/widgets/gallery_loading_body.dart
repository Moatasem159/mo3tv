part of'../screens/media_gallery_screen.dart';
class _GalleryLoadingBody extends StatelessWidget {
  const _GalleryLoadingBody();
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
          [
            const _GalleryImageList(imageType: ImageType.backDrops, isLoading: true),
            5.ph,
            const _GalleryImageList(imageType: ImageType.posters, isLoading: true),
            5.ph,
            const _GalleryImageList(imageType: ImageType.logos, isLoading: true),
            5.ph,
          ]
      ),
    );
  }
}