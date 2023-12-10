import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/auth/presentation/cubits/login_cubit/log_cubit.dart';
class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});
  @override
  Widget build(BuildContext context) {
    return MainButton(
        radius: 5,
        size: Size(MediaQuery.of(context).size.width - 250, 35),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(
                    AppStrings.logoutOfYourAccount.tr(context)!,
                    style: AppTextStyles.get14NormalText()),
                actions: [
                  TextButton(
                      onPressed: () => GoRouter.of(context).pop(),
                      child: Text(AppStrings.cancel.tr(context)!,
                          style: AppTextStyles.get14NormalText())),
                  TextButton(
                      onPressed: () {
                        LogCubit.get(context).logOut();
                        GoRouter.of(context).pop();
                      },
                      child: Text(AppStrings.logout.tr(context)!,
                          style: AppTextStyles.get14NormalText(
                              color: Colors.red)))
                ],
              );
            },
          );
        },
        label: AppStrings.logout.tr(context)!);
  }
}