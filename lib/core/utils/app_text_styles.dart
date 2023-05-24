import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
abstract class AppTextStyles{
  static TextStyle get10NormalText({Color color=Colors.white}){
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color:color,
      fontFamily: AppStrings.fontFamily);
  }
  static TextStyle get14NormalText({Color color=Colors.white}){
    return TextStyle(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.normal,
      color:color,
      fontFamily: AppStrings.fontFamily);
  }
  static TextStyle get14BoldText({Color color=Colors.white}){
    return TextStyle(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.visible,
      color:color,
      fontFamily: AppStrings.fontFamily);
  }
  static TextStyle get18BoldText({Color color=Colors.white}){
    return TextStyle(
      fontSize: 18,
      height: 1.5,
      fontWeight: FontWeight.bold,
      color:color,
      fontFamily: AppStrings.fontFamily);
  }
  static TextStyle get25BoldText({Color color=Colors.white}){
    return TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color:color,
      fontFamily: AppStrings.fontFamily);
  }
}