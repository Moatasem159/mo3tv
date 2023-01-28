import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo3tv/core/utils/app_colors.dart';
import 'package:mo3tv/core/utils/app_strings.dart';




class AppTheme {
  const AppTheme._();
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
      displayMedium: TextStyle(
          color: AppColors.primaryColor
      ),
      titleMedium:  TextStyle(
          color: AppColors.primaryTextLight
      ),
      titleSmall:  TextStyle(
          color: AppColors.primaryTextLight
      ),
      bodyLarge:  TextStyle(
          color: AppColors.primaryTextLight
      ),
      bodyMedium:  TextStyle(
          color: AppColors.primaryTextLight
      ),
      bodySmall:  TextStyle(
          color: AppColors.primaryTextLight
      ),
      labelSmall:  TextStyle(
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
  ),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.primaryColor,
        brightness: Brightness.dark,
        backgroundColor: AppColors.darkBackgroundColor));
}
