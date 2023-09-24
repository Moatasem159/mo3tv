import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo3tv/core/utils/app_colors.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
abstract class AppTheme {
  static final darkTheme = ThemeData(
    fontFamily: AppStrings.fontFamily,
    primaryColor: AppColors.primaryColorDarkTheme,
    primaryColorLight: AppColors.primaryTextLight,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      backgroundColor: AppColors.darkBackgroundColor,
    ),
    appBarTheme:const AppBarTheme(
      backgroundColor: AppColors.darkBackgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      ),
      elevation: 0,
      titleSpacing: 0,
      titleTextStyle: TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontSize: 14,
        overflow: TextOverflow.ellipsis
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white
    ),
    buttonTheme:  const ButtonThemeData(
      buttonColor:AppColors.primaryColorDarkTheme,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColorDarkTheme)
      )
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.darkBackgroundColor,
      contentTextStyle: TextStyle(
        fontFamily: AppStrings.fontFamily,
      )
    ),
   );
  static void systemChrome(){
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBackgroundColor,
        systemNavigationBarColor: AppColors.darkBackgroundColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,overlays:[SystemUiOverlay.bottom,SystemUiOverlay.top]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}