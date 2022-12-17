import 'package:flutter/material.dart';

class RecommendationsMediaEmptyWidget extends StatelessWidget {
  final IconData icon;
  final String msg;
  const RecommendationsMediaEmptyWidget({Key? key, required this.icon, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children:  [
            Icon(
              icon,
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