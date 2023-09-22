import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/widgets/similar_tv_shows_widgets/similar_tv_shows_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/similar_tv_shows_widgets/similar_tv_shows_list.dart';
class SimilarTvShowsScreenBody extends StatelessWidget {
  final List<TvShow> recommendations;
  final int tvId;
  final ScrollController ?controller;
  const SimilarTvShowsScreenBody({super.key, required this.recommendations,required this.tvId, this.controller});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>SimilarTvShowCubit(di.sl()),
      child: CustomScrollView(
        controller: controller,
        slivers: [
          CustomAppBar(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            title: AppStrings.recommendations.tr(context)!,
          ),
          SliverToBoxAdapter(child: 5.ph),
          SimilarTvShowsList(recommendations: recommendations),
          SimilarTvShowButton(tvId:  tvId),
        ],
      ),
    );
  }
}