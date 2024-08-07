import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class SeeMoreButton extends StatelessWidget{
  final VoidCallback onPressed;
  const SeeMoreButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:  Center(
        child: ElevatedButton(onPressed: onPressed,
        style: ButtonStyle(fixedSize: WidgetStateProperty.all(const Size(150,20))),
        child:Text(AppStrings.loadMore.tr(context)!,style: AppTextStyles.get14BoldText())).addSymmetricPadding(v: 5),
      ));
  }
}