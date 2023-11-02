import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/similar_movies_widgets/similar_movies_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/similar_movies_widgets/similar_movies_list.dart';
class SimilarMoviesScreenBody extends StatelessWidget {
  const SimilarMoviesScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: SimilarMovieCubit.get(context).controller,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      slivers: [
        CustomAppBar(
          onPressed: ()=>GoRouter.of(context).pop(),
          title: AppStrings.recommendations.tr(context)!),
        SliverToBoxAdapter(child: 5.ph),
        const SimilarMoviesList(),
        const SimilarMoviesButton(),
      ],
    );
  }
}