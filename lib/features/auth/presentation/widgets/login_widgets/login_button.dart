import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
import 'package:mo3tv/features/auth/presentation/cubits/log_cubit/log_cubit.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
part 'login_dialog.dart';
part 'login_button_widget.dart';
part '../loading_indicator.dart';
part '../log_out_widgets/log_out_button.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogCubit(di.sl(), di.sl(),di.sl()),
      child: BlocConsumer<LogCubit, LogStates>(
        listener: (context, state) {
          if (state is GetSessionIdSuccessState) {
            AccountCubit.get(context).getAccountDetails();
            showDialog(context: context,
                barrierDismissible: false,
                builder: (_) => const _LoginDialog());
          }
          if (state is GetTokenSuccessState) {
            context.pushNamed(Routes.loginRoute, extra: LogCubit.get(context),pathParameters: {"token":LogCubit.get(context).token.token});
          }
          if (state is LogOutSuccessState) {
            AccountCubit.get(context).getAccountDetails();
            context.goNamed(Routes.movieRoute);
          }
        },
        builder: (context, state) {
          if (state is GetTokenLoadingState || state is GetSessionIdLoadingState||state is LogOutLoadingState) {
            return const _LoadingIndicator();
          }
          if(AppStrings.sessionId=="") {
            return const _LoginButtonWidget();
          }
          if(AppStrings.sessionId!="") {
            return const _LogoutButton();
          }
          return const SizedBox();
        },
      ),
    ).addAllPadding(20);
  }
}