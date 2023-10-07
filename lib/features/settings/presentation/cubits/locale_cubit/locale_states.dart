import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
abstract class LocaleStates extends Equatable {
  final Locale locale;
  const LocaleStates(this.locale);
  @override
  List<Object> get props => [locale];
}
class ChangeLocaleState extends LocaleStates {
  final Locale selectedLocale;
   const ChangeLocaleState(this.selectedLocale): super(selectedLocale);
  Map<String, dynamic> toMap() =>{
      'selectedLocale': selectedLocale==const Locale(AppStrings.englishCode)?AppStrings.englishCode:AppStrings.arabicCode};
  factory ChangeLocaleState.fromMap(Map<String, dynamic> map) =>ChangeLocaleState(
      map['selectedLocale']=="en"?const Locale(AppStrings.englishCode):const Locale(AppStrings.arabicCode));
}