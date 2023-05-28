import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mo3tv/app/app.dart';
import 'package:mo3tv/app/bloc_observer.dart';
import 'package:mo3tv/app/injection_container.dart';
import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/features/settings/data/datasources/lang_local_datasource.dart';
void main()async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.init();
  Bloc.observer=AppBlocObserver();
  SharedPrefrencesConsumer sharedPrefrencesConsumer=di.sl<SharedPrefrencesConsumer>();
  LangLocalDataSource langLocalDataSource =di.sl<LangLocalDataSource>();
  String ?lang=await langLocalDataSource.getSavedLang();
  if(sharedPrefrencesConsumer.getData(key: AppStrings.id)!=null){
    AppStrings.sessionId=sharedPrefrencesConsumer.getData(key: AppStrings.id);
  }
  if(AppStrings.sessionId==""){
    login();
  }
  runApp(Mo3Tv(lang: lang??"en"));
  FlutterNativeSplash.remove();
}