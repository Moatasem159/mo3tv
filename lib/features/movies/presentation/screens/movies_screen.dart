import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movies_screen_widgets/movies_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movies_screen_widgets/playing_now_movies.dart';
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        PlayingNowMovies(),
        MoviesList(index: 1,title: AppStrings.trendingMoviesToday,listType: AppStrings.trending),
        MoviesList(index: 2,title: AppStrings.popularMovies,listType: AppStrings.popular),
        MoviesList(index: 3,title: AppStrings.topRatedMovies,listType: AppStrings.topRated),
      ],
    );
  }
}