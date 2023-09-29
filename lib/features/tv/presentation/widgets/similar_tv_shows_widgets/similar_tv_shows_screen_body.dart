import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/widgets/similar_tv_shows_widgets/similar_tv_shows_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/similar_tv_shows_widgets/similar_tv_shows_list.dart';
class SimilarTvShowsScreenBody extends StatelessWidget {
  const SimilarTvShowsScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: SimilarTvShowCubit.get(context).controller,
      slivers: [
        CustomAppBar(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          title: AppStrings.recommendations.tr(context)!,
        ),
        SliverToBoxAdapter(child: 5.ph),
        const SimilarTvShowsList(),
        const SimilarTvShowButton(),
      ],
    );
  }
}