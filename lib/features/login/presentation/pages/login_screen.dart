import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController ?c;
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state)async {

      },
      builder: (context, state) {
        LoginCubit cubit=BlocProvider.of<LoginCubit>(context);

        return SafeArea(
          child: WillPopScope(
            onWillPop: () async{
              if(await c!.currentUrl()=="${EndPoints.approveToken(cubit.token!.token!)}/allow")
              {
                cubit.success();
                Navigator.pop(context);
              }
              else{
                Navigator.pop(context);
              }
              return true;
            },
            child: Scaffold(
                body:WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) {c=controller;},
                  onPageStarted: (url) {},
                  gestureNavigationEnabled: true,
                  initialUrl: EndPoints.approveToken(cubit.token!.token!),
                )
            ),
          ),
        );
      },
    );
  }
}
