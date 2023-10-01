import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/account/presentation/screens/account_screen.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_states.dart';
import 'package:mo3tv/features/movies/presentation/screens/movies_screen.dart';
import 'package:mo3tv/features/search/presentation/screens/search_screen.dart';
import 'package:mo3tv/features/settings/presentation/screens/settings_screen.dart';
import 'package:mo3tv/features/tv/presentation/screens/tv_screen.dart';
class BottomNavCubit extends Cubit<BottomNavStates> {
  BottomNavCubit() : super(BottomNavInitialState()){
    index=0;
  }
  static BottomNavCubit get(context)=>BlocProvider.of(context);
  late int index;
  List<Widget> screens = [
    const MoviesScreen(),
    const TvScreen(),
    const SearchScreen(),
    const AccountScreen(),
    const SettingsScreen()
  ];
  changeIndex(int index) {
    this.index=index;
    emit(ChangeBottomNavSuccessState());
  }
}