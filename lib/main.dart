import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mo3tv/app/app.dart';
import 'package:mo3tv/app/bloc_observer.dart';
import 'package:mo3tv/config/themes/app_theme.dart';
import 'package:mo3tv/app/injection_container.dart'as di show init;
void main()async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  AppTheme.systemChrome();
  await di.init();
  Bloc.observer=AppBlocObserver();
  runApp(const Mo3Tv());
  FlutterNativeSplash.remove();
}