import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/media_poster_loading.dart';


class RecommendationsMediaLoadingList extends StatelessWidget {
  const RecommendationsMediaLoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate:
      SliverChildBuilderDelegate(childCount: 10, (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: MediaPosterLoading(),
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .65, crossAxisCount: 3, mainAxisSpacing: 7),
    );
  }
}