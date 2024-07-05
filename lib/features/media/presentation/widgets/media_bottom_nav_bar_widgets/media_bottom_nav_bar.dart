import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/media/presentation/cubits/media_bottomnav_cubit/media_bottom_nav_cubit.dart';
part 'movie_bottom_nav_bar_item.dart';
class MediaBottomNavbar extends StatelessWidget {
  const MediaBottomNavbar({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Theme.of(context).colorScheme.surface,
      child: const Row(
        children: [
          _MediaBottomNavBarItem(index: 0,icon:Icons.info_outline),
          _MediaBottomNavBarItem(index: 1,icon:Icons.tv_rounded),
          _MediaBottomNavBarItem(index: 2,icon:Icons.comment),
          _MediaBottomNavBarItem(index: 3,icon:Icons.groups_2_outlined),
          _MediaBottomNavBarItem(index: 4,icon:Icons.image_outlined),
        ],
      ),
    );
  }
}