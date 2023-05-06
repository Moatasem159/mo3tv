import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/review/reviews_loading_widgets/review_loading_widget.dart';
class ReviewsLoadingList extends StatelessWidget {
  const ReviewsLoadingList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return const ReviewLoadingWidget();
            },
          ),
        ],
      ),
    );
  }
}