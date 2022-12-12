import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_poster_widgets.dart';

class MovieCreditsLoadingList extends StatelessWidget {
  const MovieCreditsLoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate:
      SliverChildBuilderDelegate(childCount: 10, (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: MoviePosterLoading(),
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .65, crossAxisCount: 3, mainAxisSpacing: 7),
    );
  }
}