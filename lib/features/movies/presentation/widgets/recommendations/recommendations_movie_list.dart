import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Row(
                    children: [
                      Text(
                        "Recommendations :${recommendationMovies.length}",
                          style:AppTextStyles.get14BoldText()),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                              Routes.similarMoviesRoute,
                              extra: recommendationMovies,
                              queryParameters: {'movieId': movieId.toString()});
                        },
                        child:  Row(
                          children: [
                            Text("See More", style: AppTextStyles.get14NormalText()),
                            const Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Icon(Icons.arrow_forward_ios_outlined, size: 14))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                10.ph
              ],
            ),
          ),
          MoviesList(movieList: recommendationMovies),
          SliverToBoxAdapter(child: 7.ph)
        ],
      ),
    );
  }
}