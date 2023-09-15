import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
class MovieBottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  const MovieBottomNavBarItem({super.key, required this.icon, required this.index});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBottomNavCubit, MovieBottomNavStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => MovieBottomNavCubit.get(context).changeScreen(index,context),
          child: Container(
            width: MediaQuery.sizeOf(context).width / 5,
            height: 40,
            decoration: BoxDecoration(
                color: MovieBottomNavCubit.get(context).index == index
                    ? Colors.white10
                    : Colors.transparent,
                border: Border(
                    bottom: BorderSide(
                        color: MovieBottomNavCubit.get(context).index == index
                            ? Colors.red
                            : Colors.transparent,
                        width: 2))),
            child: Icon(icon,
                color: MovieBottomNavCubit.get(context).index == index
                    ? Colors.red
                    : Colors.white),
          ),
        );
      },
    );
  }
}