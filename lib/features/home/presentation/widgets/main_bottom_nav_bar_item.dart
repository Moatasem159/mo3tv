import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class MainBottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final StatefulNavigationShell navigationShell;
  const MainBottomNavBarItem({super.key, required this.icon, required this.index, required this.navigationShell});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex),
      child: Container(
        width: MediaQuery.sizeOf(context).width / 5,
        height: 40,
        decoration: BoxDecoration(
            color: navigationShell.currentIndex == index
                ? Colors.white10
                : Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    color: navigationShell.currentIndex == index
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    width: 2))),
        child: Icon(icon,
            color: navigationShell.currentIndex == index
                ? Theme.of(context).primaryColor
                : Colors.white),
      ),
    );
  }
}