import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/auth/presentation/cubits/login_cubit/log_cubit.dart';
import 'package:mo3tv/features/auth/presentation/cubits/login_cubit/log_state.dart';
import 'package:mo3tv/features/auth/presentation/widgets/loading_indicator.dart';
import 'package:mo3tv/features/auth/presentation/widgets/log_out_widgets/log_out_button.dart';
import 'package:mo3tv/features/auth/presentation/widgets/login_widgets/login_button_widget.dart';
import 'package:mo3tv/features/auth/presentation/widgets/login_widgets/login_dialog.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogCubit(di.sl(), di.sl(),di.sl()),
      child: BlocConsumer<LogCubit, LogStates>(
        listener: (context, state) {
          if (state is GetSessionIdSuccessState) {
            showDialog(context: context, builder: (context) => const LoginDialog());
          }
          if (state is GetTokenSuccessState) {
            GoRouter.of(context).pushNamed(Routes.loginRoute, extra: LogCubit.get(context).token);
          }
          if (state is LogOutSuccessState) {
            GoRouter.of(context).goNamed(Routes.movieRoute);
          }
        },
        builder: (context, state) {
          if (state is GetTokenLoadingState || state is GetSessionIdLoadingState||state is LogOutLoadingState) {
            return const LoadingIndicator();
          }
          if(AppStrings.sessionId=="") {
            return const LoginButtonWidget();
          }
          if(AppStrings.sessionId!="") {
            return const LogoutButton();
          }
          return const SizedBox();
        },
      ),
    ).addAllPadding(20);
  }
}