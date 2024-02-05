part of'../../screens/media_reviews.dart';
class _ReviewDetails extends StatelessWidget {
  final Review review;
  const _ReviewDetails(this.review);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ReviewImage(review),
        5.pw,
        _ReviewAuthorDetails(review),
      ],
    );
  }
}