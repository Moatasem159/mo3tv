part of'review_widget.dart';
class _ReviewDetails extends StatelessWidget {
  final Review review;
  const _ReviewDetails({required this.review});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ReviewImage(review: review),
        5.pw,
        _ReviewAuthorDetails(review: review),
      ],
    );
  }
}