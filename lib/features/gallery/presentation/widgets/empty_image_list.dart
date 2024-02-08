part of'../screens/media_gallery_screen.dart';
class _EmptyGallery extends StatelessWidget {
  const _EmptyGallery();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Icon(Icons.image_not_supported_outlined, size: 150),
          Text(AppStrings.noGallery.tr(context)!, style: AppTextStyles.get25BoldText()),
        ],
      ),
    );
  }
}