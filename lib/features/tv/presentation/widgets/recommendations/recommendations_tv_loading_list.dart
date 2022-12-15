import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_poster_widgets.dart';

class RecommendationsTvShowsLoadingList extends StatelessWidget {
  const RecommendationsTvShowsLoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate:
      SliverChildBuilderDelegate(childCount: 10, (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TvShowPosterLoading(),
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .65, crossAxisCount: 3, mainAxisSpacing: 7),
    );
  }
}