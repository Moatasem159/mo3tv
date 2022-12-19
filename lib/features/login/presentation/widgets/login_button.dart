import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_state.dart';
import 'package:mo3tv/features/login/presentation/pages/login_screen.dart';

class LoginButton extends StatelessWidget {
  final bool account;
  const LoginButton({Key? key,
    this.account=false
  }) : super(key: key);

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
                      Navigator.pop(context);
                    }, child: const Text("ok"))
                  ],
                );
              },);
            }
            if (state is GetTokenSuccessState) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const LoginScreen(),));
            }
          },
          builder: (context, state) {
            if(BlocProvider.of<LoginCubit>(context).token==null){
              if(state is GetTokenLoadingState)
              {
                return const LinearProgressIndicator(
                  color: Colors.red,
                );
              }
              if(state is!GetTokenLoadingState)
              {
                return ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.red)
                  ),
                  child: const Text("Login to enjoy full experience"),
                  onPressed: () async {
                    // if (state is SuccessState) {
                    //   BlocProvider.of<LoginCubit>(context)
                    //       .getSessionId(account: account,context: context);
                    // }
                    // else {
                    //   BlocProvider.of<LoginCubit>(context).getToken();
                    // }
                    BlocProvider.of<LoginCubit>(context).getToken();
                  },
                );
              }
            }
            if(state is GetSessionIdLoadingState){
              return const LinearProgressIndicator(
                color: Colors.red,
              );
            }
            if(state is SuccessState)
            {
              return ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Text("last Step"),
                onPressed: () async {
                  BlocProvider.of<LoginCubit>(context).getSessionId(account: account,context: context);
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
