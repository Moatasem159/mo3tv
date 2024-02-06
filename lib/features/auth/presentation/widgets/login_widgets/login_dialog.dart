import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text(AppStrings.loginSuccessfully.tr(context)!,style: AppTextStyles.get14NormalText()),
      content:Text(AppStrings.loginSuccessfullyDialog.tr(context)!,style: AppTextStyles.get14NormalText()),
      actions: [
        TextButton(
          onPressed:(){
            context.pop();
            context.goNamed(Routes.movieRoute);
          },
          child:Text(AppStrings.ok.tr(context)!,style: AppTextStyles.get14NormalText()),
        )
      ],
    );
  }
}