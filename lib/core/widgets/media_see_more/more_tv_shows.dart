import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/widgets/media_see_more/see_more_app_bar.dart';
import 'package:mo3tv/core/widgets/media_see_more/see_more_button.dart';
import 'package:mo3tv/core/widgets/media_see_more/see_more_loading_indicator.dart';
import 'package:mo3tv/core/widgets/media_see_more/tv_show_see_more_list.dart';
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
        SeeMoreAppBar(
          onPressed: () {
            BlocProvider.of<MoreTvShowsCubit>(context).page = 1;
            BlocProvider.of<MoreTvShowsCubit>(context).moreTvShows.clear();
            GoRouter.of(context).pop();
          },
          title: title,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 7,
          ),
        ),
        BlocBuilder<MoreTvShowsCubit, MoreTvShowsStates>(
          builder: (context, state) {
            MoreTvShowsCubit cubit = BlocProvider.of<MoreTvShowsCubit>(context);
            return TvShowsSeeMoreList(
              tvShows: cubit.moreTvShows,
            );
          },
        ),
        BlocBuilder<MoreTvShowsCubit, MoreTvShowsStates>(
          builder: (context, state) {
            if(state is GetMoreTvShowsLoadingState)
            {
              return const SeeMoreLoadingIndicator();
            }
            return SeeMoreButton(onPressed: () {
              BlocProvider.of<MoreTvShowsCubit>(context)
                  .seeMoreTvShows(index: index);
            },);
          },
        ),
      ],
    );
  }
}