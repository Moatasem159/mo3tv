import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_state.dart';
import 'package:url_launcher/link.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
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
                  Navigator.pop(context);
                }, child: const Text("ok"))
              ],
            );
          },);
        }
      },
      builder: (context, state) {
        LoginCubit cubit=BlocProvider.of<LoginCubit>(context);
        return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(state is !SuccessState||state is !GetSessionIdLoadingState)
                Center(
                  child: Link(
                    target: LinkTarget.self,
                    uri: Uri.parse(EndPoints.approveToken(cubit.token!.token!)),
                    builder: (context, followLink) {
                      return ElevatedButton(child:const Text("login"), onPressed: () {
                        followLink!();
                        Future.delayed(const Duration(seconds: 2)).then((value){
                          cubit.success();
                        });

                      },);
                    },
                  ),
                ),
                if(state is SuccessState||state is GetSessionIdSuccessState)
                 Center(
                   child: ElevatedButton(
              style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.red)
              ),
              child: const Text("last Step"),
              onPressed: () async {
                BlocProvider.of<LoginCubit>(context)
                      .getSessionId();

              },
            ),
                 ),
              ],
            )
        );
      },
    );
  }
}
