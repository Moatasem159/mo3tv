import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/features/home/presentation/widgets/main_bottom_nav_bar_item.dart';
class MainBottomNavbar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainBottomNavbar({super.key, required this.navigationShell});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          MainBottomNavBarItem(
            navigationShell: navigationShell,
            index: 0,
            icon: Icons.movie_creation_outlined,
          ),
          MainBottomNavBarItem(
            navigationShell: navigationShell,
            index: 1,
            icon: Icons.tv,
          ),
          MainBottomNavBarItem(
            navigationShell: navigationShell,
            index: 2,
            icon: Icons.search,
          ),
          MainBottomNavBarItem(
            navigationShell: navigationShell,
            index: 3,
            icon: Icons.account_circle_outlined,
          ),
          MainBottomNavBarItem(
            navigationShell: navigationShell,
            index: 4,
            icon: Icons.settings_rounded,
          ),
        ],
      ),
    );
  }
}