import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/buttons.dart';
import 'package:mo3tv/core/widgets/list_title.dart';

class MediaHorizontalError extends StatelessWidget {
  final String title;
  final  VoidCallback onPressed;
  const MediaHorizontalError({
    Key? key,
    required this.title,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTitle(title:title ),
          const Text("Something went wrong"),
          const SizedBox(
            height: 7,
          ),
          MainButton(onPressed:onPressed, label: "try again")
        ],
      ),
    );
  }
}
