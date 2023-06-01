import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class SeeMoreButton extends StatelessWidget{
  final VoidCallback onPressed;
  const SeeMoreButton({Key? key, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(onPressed: onPressed,
      child:Text(AppStrings.loadMore.tr(context)!,style: AppTextStyles.get14BoldText())).addAllPadding(8));
  }
}