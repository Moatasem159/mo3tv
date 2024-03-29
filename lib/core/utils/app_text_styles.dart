import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
abstract class AppTextStyles{
  static TextStyle getNormalText({Color color=Colors.white,double fontSize=10}){
    return TextStyle(
        fontSize: fontSize,
        height: 1.2,
        fontWeight: FontWeight.normal,
        color:color,
        fontFamily: AppStrings.fontFamily);
  }
  static TextStyle get10NormalText({Color color=Colors.white}){
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color:color,
      fontFamily: AppStrings.fontFamily);
  }
  static TextStyle get14NormalText({Color color=Colors.white,double height=1.5}){
    return TextStyle(
      fontSize: 14,
      height: height,
      fontWeight: FontWeight.normal,
      color:color,
      fontFamily: AppStrings.fontFamily);
  }
  static TextStyle get18NormalText({Color color=Colors.white}){
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color:color,
      fontFamily: AppStrings.fontFamily);
  }
  static TextStyle get14BoldText({Color color=Colors.white,double height=1.5}){
    return TextStyle(
      fontSize: 14,
      height: height,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.visible,
      color:color,
      fontFamily: AppStrings.fontFamily);
  }
  static TextStyle get18BoldText({Color color=Colors.white,double height=1.5}){
    return TextStyle(
      fontSize: 18,
      height: height,
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