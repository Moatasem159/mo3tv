import 'package:flutter/material.dart';
import 'package:mo3tv/features/home/presentation/widgets/main_bottom_nav_bar_item.dart';
class MainBottomNavbar extends StatelessWidget {
  const MainBottomNavbar({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Theme.of(context).colorScheme.background,
      child: const Row(
        children:  [
          MainBottomNavBarItem(index: 0,icon:Icons.movie_creation_outlined),
          MainBottomNavBarItem(index: 1,icon:Icons.tv),
          MainBottomNavBarItem(index: 2,icon:Icons.search),
          MainBottomNavBarItem(index: 3,icon:Icons.account_circle_outlined),
          MainBottomNavBarItem(index: 4,icon:Icons.settings_rounded),
        ],
      ),
    );
  }
}