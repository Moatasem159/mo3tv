import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/login/domain/entities/token.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginScreen extends StatefulWidget {
  final Token token;
  const LoginScreen({Key? key, required this.token}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..clearCache()..clearLocalStorage();
  @override
  void initState() {
    super.initState();
    controller.loadRequest(Uri.parse(EndPoints.approveToken(widget.token.token!)));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        LoginCubit cubit=LoginCubit.get(context);
        return SafeArea(
          child: WillPopScope(
            onWillPop: () async{
              if(await controller.currentUrl()=="${EndPoints.approveToken(cubit.token!.token!)}/allow")
              {
                cubit.success();
                return true;
              }
              else{
                cubit.initial();
                return true;
              }
            },
            child: Scaffold(
                body:WebViewWidget(controller: controller)
            ),
          ),
        );
      },
    );
  }
}
