import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mo3tv/app/app.dart';
import 'package:mo3tv/app/bloc_observer.dart';
import 'package:mo3tv/app/injection_container.dart';
import 'package:mo3tv/core/utils/app_colors.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/features/account/domain/usecases/get_account_data_usecase.dart';
import 'package:mo3tv/features/settings/data/datasources/lang_local_datasource.dart';
void main()async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.darkBackgroundColor,
      systemNavigationBarColor: AppColors.darkBackgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,overlays:[SystemUiOverlay.bottom,SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await di.init();
  Bloc.observer=AppBlocObserver();
  await di.sl<GetAccountDataUsecase>().call();
  AppStrings.appLang=await di.sl<LangLocalDataSource>().getSavedLang();
  if(AppStrings.sessionId==""){
    login();
  }
  runApp(const Mo3Tv());
  FlutterNativeSplash.remove();
}