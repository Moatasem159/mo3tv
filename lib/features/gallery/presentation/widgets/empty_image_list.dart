import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class EmptyImageList extends StatelessWidget {
  final String text;
  const EmptyImageList({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (MediaQuery.sizeOf(context).height*.18).ph,
        const Icon(Icons.image_not_supported_outlined, size: 100),
        Text(text.tr(context)!, style: AppTextStyles.get25BoldText()),
      ],
    );
  }
}