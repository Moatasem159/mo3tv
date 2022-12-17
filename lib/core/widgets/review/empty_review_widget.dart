import 'package:flutter/material.dart';

class ReviewEmptyWidget extends StatelessWidget {
  final String msg;
  const ReviewEmptyWidget({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children:  [
            const Icon(
              Icons.comments_disabled_outlined,
              size: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              msg,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}