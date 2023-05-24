import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/reviews/presentation/widgets/review_widgets/review_details.dart';
class ReviewWidget extends StatelessWidget {
  final Review review;
  const ReviewWidget({Key? key, required this.review}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(5)
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ReviewDetails(review: review),
          10.ph,
          Text(review.content!,style: AppTextStyles.get14NormalText())
        ],
      ),
    );
  }
}