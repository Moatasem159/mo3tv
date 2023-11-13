import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/media_list_item/media_list_item.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
class RecommendationsMoviesList extends StatelessWidget {
  final List<Movie> recommendationMovies;
  final int movieId;
  const RecommendationsMoviesList({super.key, required this.recommendationMovies, required this.movieId});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Row(
          children: [
            Text(
                "${AppStrings.recommendations.tr(context)!} :${recommendationMovies.length}",
                style: AppLocalizations.of(context)!.isEnLocale
                    ? AppTextStyles.get14BoldText()
                    : AppTextStyles.get18BoldText()),
            const Spacer(),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(Routes.similarMoviesRoute,
                    extra: recommendationMovies,
                    pathParameters: {'movieId': movieId.toString()});
              },
              child: Row(
                children: [
                  Text(AppStrings.seeMore.tr(context)!,
                      style: AppLocalizations.of(context)!.isEnLocale
                          ? AppTextStyles.get14BoldText()
                          : AppTextStyles.get18BoldText()),
                  const Icon(Icons.arrow_forward_ios_outlined, size: 14)
                      .addPadding(t: 3)
                ],
              ),
            )
          ],
        ).addSymmetricPadding(h: 11),
        GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recommendationMovies.length ,
          itemBuilder: (context, index) =>MediaListItem(media: recommendationMovies[index], isMovie: true),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .65, crossAxisCount: 3, mainAxisSpacing: 7)),
      ]),
    );
  }
}
