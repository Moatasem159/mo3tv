import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
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
                  child: Text("${AppStrings.reviews.tr(context)!} : ${reviews.length}",style: AppTextStyles.get18BoldText(height: 0)),),
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
        ],
      ),
    );
  }
}