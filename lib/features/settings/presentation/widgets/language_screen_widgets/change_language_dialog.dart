import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class ChangeLanguageDialog extends StatelessWidget {
  final VoidCallback onTap;
  const ChangeLanguageDialog({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      title: Text(AppStrings.changeLang.tr(context)!),
      content: Text(AppStrings.changeLangDialog.tr(context)!,
          style: AppTextStyles.getNormalText(fontSize: 13)),
      elevation: 5,
      titlePadding:
      const EdgeInsets.only(top: 15, bottom: 2.5, left: 10, right: 10),
      contentPadding:
      const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 2.5),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
      actions: [
        TextButton(onPressed: onTap, child: Text(AppStrings.agree.tr(context)!)),
        TextButton(onPressed: () => Navigator.pop(context),
        child: Text(AppStrings.disagree.tr(context)!))
      ],
    );
  }
}