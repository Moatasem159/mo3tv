import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
part 'movie_bottom_nav_bar_item.dart';
class MovieBottomNavbar extends StatelessWidget {
  const MovieBottomNavbar({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Theme.of(context).colorScheme.background,
      child: const Row(
        children: [
          _MovieBottomNavBarItem(index: 0,icon:Icons.info_outline),
          _MovieBottomNavBarItem(index: 1,icon:Icons.tv_rounded),
          _MovieBottomNavBarItem(index: 2,icon:Icons.comment),
          _MovieBottomNavBarItem(index: 3,icon:Icons.groups_2_outlined),
          _MovieBottomNavBarItem(index: 4,icon:Icons.image_outlined),
        ],
      ),
    );
  }
}