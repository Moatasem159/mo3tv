import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
class TvShowBottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  const TvShowBottomNavBarItem({super.key, required this.icon, required this.index});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowBottomNavCubit, TvShowBottomNavStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => TvShowBottomNavCubit.get(context).changeScreen(index),
          child: Container(
            width: MediaQuery.sizeOf(context).width / 5,
            height: 40,
            decoration: BoxDecoration(
                color: TvShowBottomNavCubit.get(context).index == index
                    ? Colors.white10
                    : Colors.transparent,
                border: Border(
                    bottom: BorderSide(
                        color: TvShowBottomNavCubit.get(context).index == index
                            ? Colors.red
                            : Colors.transparent,
                        width: 2))),
            child: Icon(icon,
                color: TvShowBottomNavCubit.get(context).index == index
                    ? Colors.red
                    : Colors.white),
          ),
        );
      },
    );
  }
}