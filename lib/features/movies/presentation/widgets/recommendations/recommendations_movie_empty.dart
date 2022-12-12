import 'package:flutter/material.dart';

class RecommendationsEmpty extends StatelessWidget {
  const RecommendationsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children: const [
            Icon(
              Icons.movie_filter_outlined,
              size: 70,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "No recommendations",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}