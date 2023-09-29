import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class ReviewsCount extends StatelessWidget {
  final int reviews;
  const ReviewsCount({super.key, required this.reviews});
  @override
  Widget build(BuildContext context) {
    return Text("${AppStrings.reviews.tr(context)!} : $reviews",
        style: AppTextStyles.get18BoldText(height: 0)).addSymmetricPadding(h: 11);
  }
}