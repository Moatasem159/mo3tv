import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/logout/presentation/cubit/log_out_cubit.dart';
import 'package:mo3tv/features/logout/presentation/cubit/log_out_state.dart';
import 'package:mo3tv/features/logout/presentation/widgets/log_out_button_widget.dart';
import 'package:mo3tv/features/logout/presentation/widgets/log_out_loading_indicator.dart';
class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogOutCubit, LogOutStates>(
      listener: (context, state) {
        if (state is LogOutSuccessState) {
          GoRouter.of(context).pushReplacementNamed(Routes.initialRoute);
          di.login();
          LoginCubit.get(context).initial();
        }
      },
      builder: (context, state) {
        if (state is LogOutLoadingState) {
          return const LogOutLoadingIndicator();
        }
        if (state is! LogOutLoadingState) {
          return const LogOutButtonWidget();
        }
        return Container();
      },
    );
  }
}