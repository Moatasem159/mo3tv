import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
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
                Row(
                  children: [
                    Text(
                      "${AppStrings.recommendations.tr(context)!} :${recommendationMovies.length}",
                        style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()),
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
                          Text(AppStrings.seeMore.tr(context)!, style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()),
                          const Icon(Icons.arrow_forward_ios_outlined, size: 14).addPadding(t:3)
                        ],
                      ),
                    )
                  ],
                ).addSymmetricPadding(h:11),
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