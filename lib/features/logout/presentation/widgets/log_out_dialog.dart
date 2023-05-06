import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Logout successfully"),
      actions: [
        TextButton(onPressed: () {
          GoRouter.of(context).pushReplacementNamed(Routes.initialRoute);
        }, child: const Text("ok"))
      ],
    );
  }
}