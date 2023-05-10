import 'package:flutter/material.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/reviews/presentation/widgets/review_widgets/review_widget.dart';
class MediaReviewsList extends StatelessWidget {
  final List<Review> reviews ;
  const MediaReviewsList({Key? key, required this.reviews}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    "Reviews : ${reviews.length}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return ReviewWidget(review: reviews[index]);
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: 60.ph)
        ],
      ),
    );
  }
}