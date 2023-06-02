import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class MediaWebScreen extends StatefulWidget {
  final String link;
  const MediaWebScreen({Key? key, required this.link}) : super(key: key);
  @override
  State<MediaWebScreen> createState() => _MediaWebScreenState();
}
class _MediaWebScreenState extends State<MediaWebScreen> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..clearCache()..clearLocalStorage();
  @override
  void initState() {
    super.initState();
    controller.loadRequest(Uri.parse(widget.link));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
           toolbarHeight: 40,
            leadingWidth: 50,
          ),
          body:WebViewWidget(controller: controller)));
  }
}
