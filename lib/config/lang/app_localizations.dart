import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'app_localizations_delegate.dart';
class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationsDelegate();
  late Map<String, String> _localizedStrings;
  Future<void> load() async {
    String jsonString = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map<String, String>((key, value) {
      return MapEntry(key, value.toString());
    });
  }
  String? translate(String key) => _localizedStrings[key];
  bool get isEnLocale => locale.languageCode == 'en';
  String getLang()=> isEnLocale ?"en":"ar";
}
extension TranslateX on String {
  String? tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}