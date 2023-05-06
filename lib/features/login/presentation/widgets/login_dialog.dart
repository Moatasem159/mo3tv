import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("login successfully"),
      content: const Text("Thank you for signing up in mo3Tv you can now enjoy our app in full experience"),
      actions: [
        TextButton(
          onPressed:()=>GoRouter.of(context).pushReplacementNamed(Routes.initialRoute),
          child: const Text("ok"),
        )
      ],
    );
  }
}