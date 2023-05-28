import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/settings/domain/usecases/change_lang_usecase.dart';
import 'package:mo3tv/features/settings/domain/usecases/get_saved_lang.dart';
import 'package:mo3tv/features/settings/presentation/cubits/locale_cubit/locale_states.dart';
import 'package:restart_app/restart_app.dart';
class LocaleCubit extends Cubit<LocaleStates> {
  LocaleCubit(this._getSavedLangUseCase, this._changeLangUseCase)
      : super(const ChangeLocaleState(Locale(AppStrings.englishCode)));
  final GetSavedLangUseCase _getSavedLangUseCase;
  final ChangeLangUseCase _changeLangUseCase;
  String currentLangCode=AppStrings.englishCode;
  Future <void> getSavedLang() async{
    final response= await _getSavedLangUseCase.call();
    response.fold((failure) => debugPrint("cache Failure"), (value){
      currentLangCode=value;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }
  Future <void> _changeLang(String langCode) async{
    final response= await _changeLangUseCase.call(lang: langCode);
    response.fold((failure) => debugPrint("cache Failure"),(value){
      currentLangCode=langCode;
      emit(ChangeLocaleState(Locale(currentLangCode)));
      Restart.restartApp();
    });
  }
  void toEnglish()=>_changeLang(AppStrings.englishCode);
  void toArabic()=>_changeLang(AppStrings.arabicCode);
}
