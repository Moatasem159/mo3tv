import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/connectivity/presentation/cubits/check_connectivity_cubit.dart';
import 'package:mo3tv/features/connectivity/presentation/cubits/check_connectivity_state.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_states.dart';
import 'package:mo3tv/features/home/presentation/widgets/main_bottom_nav_bar.dart';
class MainScreenBody extends StatelessWidget {
  const MainScreenBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocListener<CheckConnectivityCubit, CheckConnectivityStates>(
        listener: CheckConnectivityCubit.get(context).listen,
        child: BlocBuilder<BottomNavCubit, BottomNavStates>(
          builder: (context, state) {
            BottomNavCubit cubit = BlocProvider.of<BottomNavCubit>(context);
            return WillPopScope(
              onWillPop: () async {
                if (cubit.index != 0) {
                  cubit.changeIndex(0);
                  return false;
                } else {
                  return true;
                }
              },
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  body: cubit.screens[cubit.index],
                  bottomNavigationBar: const MainBottomNavbar(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
