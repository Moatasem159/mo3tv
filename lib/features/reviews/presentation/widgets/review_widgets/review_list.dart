import 'package:flutter/material.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/features/reviews/presentation/widgets/review_widgets/review_widget.dart';
import 'package:mo3tv/features/reviews/presentation/widgets/review_widgets/reviews_count.dart';
class MediaReviewsList extends StatelessWidget {
  final List<Review> reviews;
  const MediaReviewsList({Key? key, required this.reviews}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: reviews.length,
        (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewsCount(reviews: reviews.length),
                ReviewWidget(review: reviews[0])
              ],
            );
          }
          return ReviewWidget(review: reviews[index]);
        },
      ),
    );
  }
}