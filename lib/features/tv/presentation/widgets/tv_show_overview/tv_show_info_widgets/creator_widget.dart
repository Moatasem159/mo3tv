import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class CreatorWidget extends StatelessWidget {
  final TvShow tvShow;
  const CreatorWidget({super.key,required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tvShow.createdBy.map((e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(e.name!,style: AppTextStyles.get14BoldText()),
            Text(AppStrings.creator,style: AppTextStyles.get14NormalText()),
          ],
        );
      }).toList(),
    );
  }
}