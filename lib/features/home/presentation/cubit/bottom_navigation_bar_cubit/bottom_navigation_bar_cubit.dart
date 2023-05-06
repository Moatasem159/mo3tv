import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/screens/account_screen.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_states.dart';
import 'package:mo3tv/features/logout/presentation/cubit/log_out_cubit.dart';
import 'package:mo3tv/features/movies/presentation/screens/movies_screen.dart';
import 'package:mo3tv/features/search/presentation/screens/search_screen.dart';
import 'package:mo3tv/features/tv/presentation/screens/tv_screen.dart';
class BottomNavCubit extends Cubit<BottomNavStates> {
  BottomNavCubit() : super(BottomNavInitialState());
  int index=0;
  List<Widget> screens = [
    const MoviesScreen(),
    const TvScreen(),
    const SearchScreen(),
    const AccountScreen(),
  ];
  changeIndex(int index, BuildContext context) {
    emit(ChangeBottomNavLoadingState());
    this.index=index;
    if(index==3&&(
        AccountCubit.get(context).account==null
            &&AppStrings.sessionId!=""
            &&LogOutCubit.get(context).isLoggedOut==true))
      {
        AccountCubit.get(context).getAccountDetails();
        AccountCubit.get(context).getLists();
      }
    emit(ChangeBottomNavSuccessState());
  }
}