import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/account/presentation/screens/account_screen.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_states.dart';
import 'package:mo3tv/features/movies/presentation/screens/movies_screen.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_cubit.dart';
import 'package:mo3tv/features/search/presentation/screens/search_screen.dart';
import 'package:mo3tv/features/tv/presentation/screens/tv_screen.dart';

class BottomNavCubit extends Cubit<BottomNavStates> {
  BottomNavCubit() : super(BottomNavInitialState());
  int index=0;

  bool movie=true;
  bool tv=false;
  bool account=false;
  bool search=false;

  List<Widget> screens = [
    const MoviesScreen(),
    const TvScreen(),
    const SearchScreen(),
    const AccountScreen(),
  ];

  changeIndex(int index, BuildContext context) {
    emit(ChangeBottomNavLoadingState());
    this.index=index;
    BlocProvider.of<SearchCubit>(context).clear();
    if(index==0)
      {
        movie=true;
        tv=false;
        account=false;
        search=false;
      }
    if(index==1)
    {
      movie=false;
      tv=true;
      account=false;
      search=false;
    }
    if(index==2){
      movie=false;
      tv=false;
      account=false;
      search=true;
    }
    if(index==3)
    {
      movie=false;
      tv=false;
      account=true;
      search=false;
    }
    emit(ChangeBottomNavSuccessState());
  }
}
