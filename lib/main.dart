import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mo3tv/app/app.dart';
import 'package:mo3tv/app/bloc_observer.dart';
import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/app/injection_container.dart'as di;

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.init();
  await Future.delayed(const Duration(seconds: 2));
  Bloc.observer=AppBlocObserver();
  SharedPrefrencesConsumer sharedPrefrencesConsumer=di.sl<SharedPrefrencesConsumer>();
  if(sharedPrefrencesConsumer.getData(key: AppStrings.id)!=null) {
    AppStrings.sessionId=sharedPrefrencesConsumer.getData(key: AppStrings.id);
  }
  runApp(const Mo3Tv());
  FlutterNativeSplash.remove();
}



