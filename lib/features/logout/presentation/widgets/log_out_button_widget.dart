import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/features/logout/presentation/cubit/log_out_cubit.dart';
class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 24,
      alignment: Alignment.center,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("are you sure you want logout ?"),
              actions: [
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                      LogOutCubit.get(context).logOut();
                    },
                    child: const Text("yes")),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Text("no"))
              ],
            );
          },
        );
      },
      icon: const Icon(
        Icons.login_outlined,
        color: Colors.red,
      ),
    );
  }
}
