part of 'media_poster.dart';
class _PosterPlaceHolder extends StatelessWidget {
  const _PosterPlaceHolder();
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8.0))));
  }
}