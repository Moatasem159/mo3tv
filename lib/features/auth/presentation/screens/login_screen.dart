import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/auth/domain/entities/token.dart';
import 'package:webview_flutter/webview_flutter.dart';
class LoginScreen extends StatefulWidget {
  final Token token;
  const LoginScreen({Key? key, required this.token}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller=WebViewController()..loadRequest(Uri.parse(EndPoints.approveToken(widget.token.token)))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..clearCache()..clearLocalStorage()..setNavigationDelegate(NavigationDelegate(
        onUrlChange: (change) {
       if(change.url=="${EndPoints.approveToken(widget.token.token)}/allow")
       {
         setState(() {
           AppStrings.tokenSuccess="allow";
         });
          }
        },
      ));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            titleSpacing: 0,
            titleTextStyle: AppTextStyles.get14BoldText(),
            title:Text(AppStrings.tokenSuccess=="allow"?AppStrings.loginConfirm.tr(context)!:""),
            backgroundColor: AppStrings.tokenSuccess=="allow"?Colors.green:Theme.of(context).colorScheme.background,
          ),
            body:WebViewWidget(controller: controller)));
  }
}