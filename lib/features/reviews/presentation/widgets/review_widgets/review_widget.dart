part of'../../screens/media_reviews.dart';
class _ReviewWidget extends StatelessWidget {
  final Review review;
  const _ReviewWidget(this.review);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          _ReviewDetails(review),
          10.ph,
          ReadMoreWidget(content: review.content),
        ],
      ),
    );
  }
}