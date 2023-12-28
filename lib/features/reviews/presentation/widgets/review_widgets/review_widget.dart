import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/core/widgets/read_more_widget.dart';
part 'review_details.dart';
part 'review_image.dart';
part 'review_author_details.dart';
class ReviewWidget extends StatelessWidget {
  final Review review;
  const ReviewWidget({super.key, required this.review});
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
          _ReviewDetails(review: review),
          10.ph,
          ReadMoreWidget(content: review.content),
        ],
      ),
    );
  }
}