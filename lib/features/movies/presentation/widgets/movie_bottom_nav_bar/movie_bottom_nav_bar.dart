import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_bottom_nav_bar/movie_bottom_nav_bar_item.dart';
class MovieBottomNavbar extends StatelessWidget {
  const MovieBottomNavbar({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Theme.of(context).colorScheme.background,
      child: const Row(
        children: [
          MovieBottomNavBarItem(index: 0,icon:Icons.info_outline),
          MovieBottomNavBarItem(index: 1,icon:Icons.tv_rounded),
          MovieBottomNavBarItem(index: 2,icon:Icons.comment),
          MovieBottomNavBarItem(index: 3,icon:Icons.groups_2_outlined),
          MovieBottomNavBarItem(index: 4,icon:Icons.image_outlined),
        ],
      ),
    );
  }
}