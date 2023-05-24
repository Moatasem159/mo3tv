import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class TaglineWidget extends StatelessWidget {
  final String tagline;
  const TaglineWidget({super.key,required this.tagline});
  @override
  Widget build(BuildContext context) {
    if (tagline != "") {
      return Column(
        children: [
          Text(tagline,
            maxLines: null,
            overflow: TextOverflow.visible,
            style: AppTextStyles.get14BoldText(color: Colors.grey[600]!)),
        ],
      );
    }
    return Container();
  }
}