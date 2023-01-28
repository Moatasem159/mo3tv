import 'package:flutter/material.dart';
class SeeMoreAppBar extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const SeeMoreAppBar({Key? key, required this.onPressed, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_back)),
      title: Text(title),
      snap: true,
      floating: true,
      stretch: true,
    );
  }
}