part of'../screens/media_reviews.dart';
class _MediaReviewsList extends StatelessWidget {
  final List<Review> reviews;
  const _MediaReviewsList({required this.reviews});
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
     itemCount: reviews.length,
     itemBuilder: (context, index) {
       if (index == 0) {
         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             _ReviewsCount(reviews.length),
             _ReviewWidget(reviews[0])
           ],
         );
       }
       return _ReviewWidget(reviews[index]);
     },
    );
  }
}