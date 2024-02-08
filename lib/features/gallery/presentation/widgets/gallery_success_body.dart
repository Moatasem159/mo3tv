part of'../screens/media_gallery_screen.dart';
class _GallerySuccessBody extends StatelessWidget {
  final Gallery gallery;
  final String mediaType;
  const _GallerySuccessBody({required this.mediaType, required this.gallery});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        _GalleryImageList(mediaType: mediaType,images: gallery.backdrops,imageType: ImageType.backDrops,isLoading: false),
        5.ph,
        _GalleryImageList(mediaType: mediaType,images: gallery.posters,imageType: ImageType.posters,isLoading: false),
        5.ph,
        _GalleryImageList(mediaType: mediaType,images: gallery.logos,imageType: ImageType.logos,isLoading: false),
        5.ph
      ]
      ),
    );
  }
}