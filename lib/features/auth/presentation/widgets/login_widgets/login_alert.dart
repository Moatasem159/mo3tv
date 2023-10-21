import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class LoginAlert extends StatelessWidget {
  const LoginAlert({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: Text(AppStrings.youMustLoginFirst.tr(context)!,style: AppTextStyles.get14NormalText()),
      actions: [
        TextButton(
          child: Text(AppStrings.ok.tr(context)!,style: AppTextStyles.get14NormalText()),
          onPressed: ()=>GoRouter.of(context).pop()),
      ],
    );
  }
}