import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class TypeWidget extends StatelessWidget {
  final String type;
  const TypeWidget({super.key,required this.type});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.type.tr(context)!,style: AppTextStyles.get14BoldText()),
        Text(type,style: AppTextStyles.get14NormalText()),
      ],
    );
  }
}