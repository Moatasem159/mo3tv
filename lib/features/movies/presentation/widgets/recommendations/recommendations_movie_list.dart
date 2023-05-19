import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list.dart';
class RecommendationsMoviesList extends StatelessWidget {
  final List<Movie> recommendationMovies;
  final int movieId;
  const RecommendationsMoviesList({Key? key, required this.recommendationMovies, required this.movieId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Text(
                        "Recommendations :${recommendationMovies.length}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                            Routes.similarMoviesRoute,
                            extra: recommendationMovies,
                            queryParameters: {'movieId': movieId.toString()});
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text("See More", style: TextStyle(fontSize: 15)),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                15.ph
              ],
            ),
          ),
          MoviesList(movieList: recommendationMovies),
          SliverToBoxAdapter(child: 10.ph)
        ],
      ),
    );
  }
}
