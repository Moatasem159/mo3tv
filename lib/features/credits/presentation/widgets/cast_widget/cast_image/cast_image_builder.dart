part of'../../../screens/media_credits_screen.dart';
class _CastImageBuilder extends StatelessWidget {
  final ImageProvider<Object> imageProvider;
  const _CastImageBuilder(this.imageProvider);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
      ),
    );
  }
}