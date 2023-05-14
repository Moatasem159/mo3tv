import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo3tv/core/utils/app_colors.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
class AppTheme {
  const AppTheme._();
  static final darkTheme = ThemeData(
    fontFamily: AppStrings.fontFamily,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryTextLight,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primaryColor,
      brightness: Brightness.dark,
      backgroundColor: AppColors.darkBackgroundColor,
    ),
    appBarTheme:AppBarTheme(
      backgroundColor: AppColors.darkBackgroundColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light
      ),
      iconTheme: const IconThemeData(
          color: Colors.white
      ),
      elevation: 0,
      titleSpacing: 0,
      titleTextStyle: const TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontSize: 14,
        overflow: TextOverflow.ellipsis
      ),
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
          color: AppColors.primaryTextLight
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
    iconTheme: const IconThemeData(
      color: Colors.white
    ),
    buttonTheme:  ButtonThemeData(
      buttonColor:AppColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
      )
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkBackgroundColor,
      contentTextStyle: const TextStyle(
        fontFamily: AppStrings.fontFamily,
      )
    ),
   );
}