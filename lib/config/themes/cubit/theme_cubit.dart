import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/themes/cubit/theme_state.dart';

import 'package:shared_preferences/shared_preferences.dart';



class ThemeCubit extends Cubit<ThemesStates> {



  ThemeCubit({required this.sharedPreferences}) : super(AppThemeInitialState());
  final SharedPreferences  sharedPreferences;

  Widget icon=const Icon(Icons.brightness_low_sharp);
  bool dark=false;
  void changeThemeMode({bool? fromShared}) async{
    if(fromShared!=null){
      dark = fromShared;
      icon=dark?const Icon(Icons.brightness_2_outlined):const Icon(Icons.brightness_low_sharp);

      // AppTheme.setStatusBarAndNavigationBarColors(dark);
      emit(ChangeAppThemeState());
    }
    else {
      dark = !dark;
       sharedPreferences.setBool("dark", dark).then((value) {
       icon=dark?const Icon(Icons.brightness_2_outlined):const Icon(Icons.brightness_low_sharp);
        emit(ChangeAppThemeState());
      });
    }

  }
}
