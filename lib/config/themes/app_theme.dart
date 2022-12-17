import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mo3tv/core/utils/app_colors.dart';
import 'package:mo3tv/core/utils/app_strings.dart';




class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    textTheme: TextTheme(
      headline2: TextStyle(
        color: AppColors.primaryColor
      ),
      subtitle1:  TextStyle(
        color: AppColors.primaryTextDark
      ),
      subtitle2: TextStyle(
          color: AppColors.primaryTextDark
      ),
      bodyText1: TextStyle(
          color: AppColors.primaryTextDark
      ),
      bodyText2: TextStyle(
          color: AppColors.primaryTextDark
      ),
      overline: TextStyle(
          color: AppColors.primaryTextDark
      ),
      caption: TextStyle(
          color: AppColors.primaryTextDark
      ),
    ),
    appBarTheme:  AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light
      ),
      backgroundColor: AppColors.whiteBackgroundColor,
      iconTheme: const IconThemeData(
          color: Colors.black
      ),
      elevation:5,),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      elevation: 5,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: AppColors.whiteBackgroundColor,
      unselectedItemColor: Colors.black.withOpacity(.5),
      selectedItemColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
    ),
    iconTheme: const IconThemeData(
        color: Colors.black
    ),
    brightness: Brightness.light,
    buttonTheme:  ButtonThemeData(
      buttonColor:AppColors.primaryColor,

    ),
    fontFamily: AppStrings.fontFamily,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryTextDark,
    backgroundColor: AppColors.whiteBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.darkBackgroundColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light
      ),
      iconTheme: const IconThemeData(
          color: Colors.white
      ),
      elevation: 5,),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      elevation: 5,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedItemColor: Colors.grey.withOpacity(.8),
      backgroundColor: AppColors.darkBackgroundColor,
      selectedItemColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      headline2: TextStyle(
          color: AppColors.primaryColor
      ),
      subtitle1:  TextStyle(
          color: AppColors.primaryTextLight
      ),
      subtitle2:  TextStyle(
          color: AppColors.primaryTextLight
      ),
      bodyText1:  TextStyle(
          color: AppColors.primaryTextLight
      ),
      bodyText2:  TextStyle(
          color: AppColors.primaryTextLight
      ),
      caption:  TextStyle(
          color: AppColors.primaryTextLight
      ),
      overline:  TextStyle(
          color: AppColors.primaryTextLight
      ),


    ),
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(
      color: Colors.white
    ),
    buttonTheme:  ButtonThemeData(
      buttonColor:AppColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red)
      )
    ),
    fontFamily: AppStrings.fontFamily,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryTextLight,
    backgroundColor: AppColors.darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.red,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      )
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkBackgroundColor,
      contentTextStyle: const TextStyle(
        fontFamily: AppStrings.fontFamily,
      )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.red
    )

  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
  }
}
