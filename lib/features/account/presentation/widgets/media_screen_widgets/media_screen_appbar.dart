import 'package:flutter/material.dart';
class MediaScreenAppBar extends StatelessWidget {
  final String title;
  const MediaScreenAppBar({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
      title: Text(title),
      snap: true,
      floating: true,
      stretch: true,
    );
  }
}