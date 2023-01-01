import 'package:flutter/material.dart';

class MediaBottomNavBar extends StatelessWidget {
  final bool isVisible;
  final List<Widget> items;
  final int index;
  final ValueChanged<int>? onTap;
  const MediaBottomNavBar({
    Key? key,
    this.isVisible=true,
    required this.items,
    required this.index,
    this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isVisible?70:0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceInOut,
      child: Wrap(
          children: [
            NavigationBar(
              elevation:3,
              backgroundColor: Colors.black12,
              surfaceTintColor: Colors.black45,
              animationDuration: const Duration(seconds: 2),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations:items,
              selectedIndex: index,
              onDestinationSelected: onTap
            ),
          ]
      ),
    );
  }
}
