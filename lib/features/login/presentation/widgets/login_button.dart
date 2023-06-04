import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_state.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_button_widget.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_dialog.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_loading_indicator.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener:(context,state){
        if(state is GetSessionIdSuccessState)
        {
          AccountCubit.get(context).getAccountDetails(sessionId: state.sessionId);
          showDialog(context: context, builder:(context) => const LoginDialog());
        }
        if (state is GetTokenSuccessState)
        {
          GoRouter.of(context).pushNamed(Routes.loginRoute,extra: LoginCubit.get(context).token!);
        }
      },
      builder:(context,state){
        if(state is LoginInitialState){
          return LoginButtonWidget(
            onTap: () async {
              LoginCubit.get(context).getToken();
            },
            title:AppStrings.loginToEnjoyFullExperience);
        }
        if(state is GetTokenLoadingState) {
          return const LoginLoadingIndicator();
        }
        if(state is GetSessionIdLoadingState){
          return const LoginLoadingIndicator();
        }
        if(state is SuccessState) {
          return LoginButtonWidget(
            onTap: () async {
              LoginCubit.get(context).getSessionId();
            },
            title:AppStrings.lastStep,
          );
        }
        return Container();
      },
    ).addAllPadding(20);
  }
}