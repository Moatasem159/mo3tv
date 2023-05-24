import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text("login successfully",style: AppTextStyles.get14NormalText()),
      content: Text("Thank you for signing up in mo3Tv you can now enjoy our app in full experience",
          style: AppTextStyles.get14NormalText()),
      actions: [
        TextButton(
          onPressed:()=>GoRouter.of(context).pushReplacementNamed(Routes.initialRoute),
          child:  Text("ok",style: AppTextStyles.get14NormalText()),
        )
      ],
    );
  }
}