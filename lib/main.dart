import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mo3tv/app/app.dart';
import 'package:mo3tv/app/injection_container.dart'as di show init;
void main()async{
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await di.init();
  runApp(const Mo3Tv());
  FlutterNativeSplash.remove();
}