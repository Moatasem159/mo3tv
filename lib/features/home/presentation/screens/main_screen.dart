import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:mo3tv/features/home/presentation/widgets/activescreen.dart';
import 'package:mo3tv/features/home/presentation/widgets/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: const SafeArea(
        child: Scaffold(
          // backgroundColor: Theme.of(context).backgroundColor,
          body: ActiveScreen(),
          bottomNavigationBar: BottomNavBar(),
        ),
      ),
    );
  }
}
