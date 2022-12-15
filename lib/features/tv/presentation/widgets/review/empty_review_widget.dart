import 'package:flutter/material.dart';

class ReviewEmptyList extends StatelessWidget {
  const ReviewEmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children: const [
            Icon(
              Icons.comments_disabled_outlined,
              size: 70,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "No reviews on this series",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}