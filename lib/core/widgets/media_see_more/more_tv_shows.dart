import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/core/widgets/buttons/see_more_button.dart';
import 'package:mo3tv/core/widgets/media_loading/sliver_loading_indicator.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_state.dart';
class MoreTvShows extends StatelessWidget {
  final String title;
  final int index;
  final List media;
  final ScrollController ?controller;
  const MoreTvShows({Key? key, required this.title, required this.index, required this.media, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        CustomAppBar(
          title: title,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        SliverToBoxAdapter(child: 7.ph),
        BlocBuilder<MoreTvShowsCubit, MoreTvShowsStates>(
          builder: (context, state) {
            MoreTvShowsCubit cubit =  MoreTvShowsCubit.get(context);
            if(cubit.moreTvShows.isEmpty)
            {
              cubit.moreTvShows.addAll(media as List<TvShow>);
            }
            return TvList(tvList: cubit.moreTvShows);
          },
        ),
        BlocBuilder<MoreTvShowsCubit, MoreTvShowsStates>(
          builder: (context, state) {
            if(state is GetMoreTvShowsLoadingState)
            {
              return const SliverLoadingIndicator();
            }
            return SeeMoreButton(onPressed: () {
              MoreTvShowsCubit.get(context)
                  .seeMoreTvShows(index: index,lang: AppLocalizations.of(context)!.getLang());
            },);
          },
        ),
      ],
    );
  }
}