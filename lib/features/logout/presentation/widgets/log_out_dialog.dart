import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Logout successfully"),
      actions: [
        TextButton(onPressed: () {
          GoRouter.of(context).pushReplacementNamed(Routes.initialRoute);
        }, child:  Text("ok",style: AppTextStyles.get14NormalText()))
      ],
    );
  }
}