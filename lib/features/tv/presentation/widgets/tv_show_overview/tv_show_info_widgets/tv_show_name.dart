import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class TvShowName extends StatelessWidget {
  final String name;
  final String firstAirDate;
  const TvShowName({super.key, required this.name,required this.firstAirDate});
  @override
  Widget build(BuildContext context) {
    return Text(
      "$name ${firstAirDate == "" ? '' : ((firstAirDate.substring(0, 4)))}",
      maxLines: null,
      overflow: TextOverflow.visible,
      style: AppTextStyles.get14BoldText()
    );
  }
}