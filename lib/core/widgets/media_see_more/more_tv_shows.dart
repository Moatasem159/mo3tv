import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/core/widgets/buttons/see_more_button.dart';
import 'package:mo3tv/core/widgets/sliver_loading_indicator.dart';
import 'package:mo3tv/core/widgets/tv_show_sliver_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_state.dart';
class MoreTvShows extends StatelessWidget {
  final String title;
  final int index;
  const MoreTvShows({Key? key, required this.title, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(
          onPressed: () {
           MoreTvShowsCubit.get(context).page = 1;
           MoreTvShowsCubit.get(context).moreTvShows.clear();
            GoRouter.of(context).pop();
          },
          title: title,
        ),
         SliverToBoxAdapter(child: 7.ph),
        BlocBuilder<MoreTvShowsCubit, MoreTvShowsStates>(
          builder: (context, state) {
            MoreTvShowsCubit cubit =  MoreTvShowsCubit.get(context);
            return TvShowsSliverList(
              tvShows: cubit.moreTvShows,
            );
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
                  .seeMoreTvShows(index: index);
            },);
          },
        ),
      ],
    );
  }
}