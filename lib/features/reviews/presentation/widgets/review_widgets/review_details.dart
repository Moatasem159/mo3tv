import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/features/reviews/presentation/widgets/review_widgets/review_author_details.dart';
import 'package:mo3tv/features/reviews/presentation/widgets/review_widgets/review_image.dart';
class ReviewDetails extends StatelessWidget {
  final Review review;
  const ReviewDetails({super.key,required this.review});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ReviewImage(
            name: review.authorDetails.name,
            username: review.authorDetails.username,
            image:review.authorDetails.avatarPath),
        5.pw,
        ReviewAuthorDetails(review: review),
      ],
    );
  }
}