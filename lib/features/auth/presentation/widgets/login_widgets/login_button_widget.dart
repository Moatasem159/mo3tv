import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/auth/presentation/cubits/login_cubit/log_cubit.dart';
class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)),
      onPressed: () async {
        if (AppStrings.tokenSuccess == "allow") {
          AppStrings.tokenSuccess = "";
          await LogCubit.get(context).getSessionId();
        }
        else {
          await LogCubit.get(context).getToken();
        }
      },
      child:Text(AppStrings.loginToEnjoyFullExperience.tr(context)!,style: AppTextStyles.get14NormalText()),
    );
  }
}