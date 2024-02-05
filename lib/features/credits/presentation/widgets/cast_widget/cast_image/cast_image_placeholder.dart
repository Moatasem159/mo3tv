part of'../../../screens/media_credits_screen.dart';
class _CastImagePlaceholder extends StatelessWidget {
  const _CastImagePlaceholder();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(image: AssetImage(AppAssets.personPlaceholder),fit: BoxFit.cover),
      ),
    );
  }
}