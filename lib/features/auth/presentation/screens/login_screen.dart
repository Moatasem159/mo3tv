import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_colors.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/main_button.dart';
import 'package:mo3tv/features/auth/presentation/cubits/log_cubit/log_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';
class LoginScreen extends StatefulWidget {
  final String token;
  const LoginScreen({super.key, required this.token});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  late final WebViewController controller;
  bool isReady=false;
  double progress=0;
  @override
  void initState() {
    super.initState();
    controller=WebViewController()..loadRequest(Uri.parse(EndPoints.approveToken(widget.token)))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..clearCache()..clearLocalStorage()..setNavigationDelegate(NavigationDelegate(
        onUrlChange: (change) {
       if(change.url=="${EndPoints.approveToken(widget.token)}/allow")
       {
         setState(() {
           AppStrings.tokenSuccess="allow";
         });
          }
        },
        onProgress: (progress) {
         setState(() {
           this.progress=progress.toDouble()/100;
          });
        },
        onPageFinished: (url) {
          setState(() {
            isReady=true;
          });
        },
      ));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 115,
            leading:isReady?MainButton(
              color: AppStrings.tokenSuccess=="allow"?AppColors.primaryColorDarkTheme:Colors.grey,
                onPressed: AppStrings.tokenSuccess=="allow"?()async{
                  AppStrings.tokenSuccess='';
                  GoRouter.of(context).pop();
                  await LogCubit.get(context).getSessionId();
                }:null,
                label: AppStrings.login.tr(context)!).addSymmetricPadding(h: 15,v: 10):null,
          ),
          body:
          isReady?WebViewWidget(controller: controller):Center(child: CircularProgressIndicator(
            value:progress,
            strokeWidth: 5,
            strokeAlign: 25,
            backgroundColor: Colors.white,
            valueColor:const AlwaysStoppedAnimation<Color>(AppColors.primaryColorDarkTheme)
          ))));
  }
}