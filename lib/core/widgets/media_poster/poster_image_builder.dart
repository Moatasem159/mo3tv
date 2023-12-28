part of 'media_poster.dart';
class _PosterImageBuilder extends StatelessWidget {
  final ImageProvider poster;
  const _PosterImageBuilder({required this.poster});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: poster, fit: BoxFit.cover),
      ),
    );
  }
}