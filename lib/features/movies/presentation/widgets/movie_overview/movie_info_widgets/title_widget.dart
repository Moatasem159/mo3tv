import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class TitleWidget extends StatelessWidget {
  final String title;
  final String releaseDate;
  const TitleWidget({super.key, required this.title, required this.releaseDate});
  @override
  Widget build(BuildContext context) {
    return Text(
        "$title ${releaseDate == "" ? '' : ((releaseDate.substring(0, 4)))}",
        maxLines: null,
        overflow: TextOverflow.visible,
        style:AppTextStyles.get14BoldText());
  }
}