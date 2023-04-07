import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(AppStrings.sessionId.isEmpty)
    {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if(state is GetSessionIdSuccessState)
            {
              showDialog(context: context, builder:(context) {
                return  AlertDialog(
                  title: const Text("login successfully"),
                  content: const Text("Thank you for signing up in mo3Tv you can now enjoy our app in full experience"),
                  actions: [
                    TextButton(onPressed: () {
                      GoRouter.of(context).pushReplacementNamed(Routes.initialRoute);
                      LoginCubit.get(context).close();
                    }, child: const Text("ok"))
                  ],
                );
              });

            }
            if (state is GetTokenSuccessState) {
              GoRouter.of(context).pushNamed(Routes.loginRoute,extra: LoginCubit.get(context).token!);
            }
          },
          builder: (context, state) {
            if(state is LoginInitialState){
              return Padding(
                padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/7,
                vertical: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.red)
                  ),
                  child: const Text("Login to enjoy full experience"),
                  onPressed: () async {
                    LoginCubit.get(context).getToken();
                  },
                ),
              );
            }
            if(state is GetTokenLoadingState) {
              return const LinearProgressIndicator(
                color: Colors.red,
              );
            }
            if(state is GetSessionIdLoadingState){
              return const LinearProgressIndicator(
                color: Colors.red,
              );
            }
            if(state is SuccessState) {
              return ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Text("last Step"),
                onPressed: () async {
                 LoginCubit.get(context).getSessionId();
                },
              );
            }
            return Container();
          },
        ),
      );
    }
    return Container();
  }
}
