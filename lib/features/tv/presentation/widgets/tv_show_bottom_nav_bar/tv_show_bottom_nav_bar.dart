import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_bottom_nav_bar/tv_show_bottom_nav_bar_item.dart';
class TvShowBottomNavbar extends StatelessWidget {
  const TvShowBottomNavbar({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Theme.of(context).colorScheme.background,
      child: const Row(
        children:  [
          TvShowBottomNavBarItem(index: 0,icon:Icons.info_outline),
          TvShowBottomNavBarItem(index: 1,icon:Icons.tv_rounded),
          TvShowBottomNavBarItem(index: 2,icon:Icons.comment),
          TvShowBottomNavBarItem(index: 3,icon:Icons.groups_2_outlined),
          TvShowBottomNavBarItem(index: 4,icon:Icons.image_outlined),
        ],
      ),
    );
  }
}