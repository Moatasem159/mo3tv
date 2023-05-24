import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
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
              title:  Text("are you sure you want logout ?",style: AppTextStyles.get14NormalText()),
              actions: [
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                      LogOutCubit.get(context).logOut();
                    },
                    child:  Text("yes",style: AppTextStyles.get14NormalText())),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text("no",style: AppTextStyles.get14NormalText()))
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
