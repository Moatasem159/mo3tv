import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/logout/presentation/cubit/log_out_cubit.dart';
class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MainButton(
      radius:5,
      size: Size(MediaQuery.of(context).size.width-150,40),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title:  Text(AppStrings.logoutOfYourAccount.tr(context)!,style: AppTextStyles.get14NormalText()),
              actions: [
                TextButton(
                    onPressed: ()=> GoRouter.of(context).pop(),
                    child: Text(AppStrings.cancel.tr(context)!,style: AppTextStyles.get14NormalText())),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                      LogOutCubit.get(context).logOut();
                    },
                    child:  Text(AppStrings.logout.tr(context)!,style: AppTextStyles.get14NormalText(color: Colors.red)))
              ],
            );
          },
        );
      },
      label: AppStrings.logout.tr(context)!);
  }
}
