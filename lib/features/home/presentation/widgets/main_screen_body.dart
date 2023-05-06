import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_states.dart';
import 'package:mo3tv/features/home/presentation/widgets/bottom_nav_bar.dart';
class MainScreenBody extends StatelessWidget {
  const MainScreenBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, BottomNavStates>(
        builder: (context, state) {
          BottomNavCubit cubit=BlocProvider.of<BottomNavCubit>(context);
          return WillPopScope(
            onWillPop: () async {
              if (cubit.index != 0){
                cubit.changeIndex(0, context);
                return false;
              }
              else {
                return true;
              }
            },
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset:false,
                backgroundColor: Theme.of(context).colorScheme.background,
                body: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    cubit.screens[cubit.index],
                    CustomBottomNav(
                      index: cubit.index,
                      onTap1: () {
                        cubit.changeIndex(0, context);
                      },
                      onTap2: () {
                        cubit.changeIndex(1, context);
                      },
                      onTap3: () {
                        cubit.changeIndex(2, context);
                      },
                      onTap4: () {
                        cubit.changeIndex(3, context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}