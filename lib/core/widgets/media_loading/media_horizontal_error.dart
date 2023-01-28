import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/buttons.dart';

class MediaHorizontalError extends StatelessWidget {
  final  VoidCallback onPressed;
  const MediaHorizontalError({
    Key? key,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
