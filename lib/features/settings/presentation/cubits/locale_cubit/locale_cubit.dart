import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/settings/presentation/cubits/locale_cubit/locale_states.dart';
import 'package:restart_app/restart_app.dart';
class LocaleCubit extends HydratedCubit<LocaleStates> {
  LocaleCubit():super(const ChangeLocaleState(Locale(AppStrings.englishCode)));
  static LocaleCubit get(context)=>BlocProvider.of(context);
  Future <void> _changeLang(String langCode) async{
    AppStrings.appLang = langCode;
    emit(ChangeLocaleState(Locale(langCode)));
    Restart.restartApp();
  }
  void toEnglish()=>_changeLang(AppStrings.englishCode);
  void toArabic()=>_changeLang(AppStrings.arabicCode);
  static bool buildWhen(previous, current){
    return previous != current;
  }
  @override
  LocaleStates? fromJson(Map<String, dynamic> json){
    AppStrings.appLang=json["selectedLocale"];
    return ChangeLocaleState.fromMap(json);
  }
  @override
  Map<String, dynamic>? toJson(LocaleStates state) {
    if(state is ChangeLocaleState)
      {
        return state.toMap();
      }
    else{
      return null;
    }
  }
}