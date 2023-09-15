import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:mo3tv/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_states.dart';
class MainBottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  const MainBottomNavBarItem({super.key, required this.icon, required this.index});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => BottomNavCubit.get(context).changeIndex(index),
          child: Container(
            width: MediaQuery.sizeOf(context).width / 5,
            height: 40,
            decoration: BoxDecoration(
                color: BottomNavCubit.get(context).index == index
                    ? Colors.white10
                    : Colors.transparent,
                border: Border(
                    bottom: BorderSide(
                        color: BottomNavCubit.get(context).index == index
                            ? Colors.red
                            : Colors.transparent,
                        width: 2))),
            child: Icon(icon,
                color: BottomNavCubit.get(context).index == index
                    ? Colors.red
                    : Colors.white),
          ),
        );
      },
    );
  }
}