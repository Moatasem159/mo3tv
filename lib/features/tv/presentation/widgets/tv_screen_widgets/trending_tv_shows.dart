import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_loading_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/trending_tv_show_cubit/trending_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/trending_tv_show_cubit/trending_tv_show_state.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
class TrendingTvShow extends StatelessWidget {
  const TrendingTvShow({super.key});
  @override
  Widget build(BuildContext context) {
    const String title = AppStrings.trendingTvShows;
    return BlocProvider(
      create: (context) => TrendingTvShowCubit(di.sl())..getTrendingTvShowsData(),
      child: BlocBuilder<TrendingTvShowCubit, TrendingTvShowStates>(
        builder: (context, state) {
          if (state is GetTrendingTvShowsSuccessState) {
            return MediaHorizontalList(
              media: state.tvShows,
              isMovie: false,
              title: title,
              onPressed: () {
                GoRouter.of(context).pushNamed(Routes.seeMoreRoute,
                    extra: SeeMoreParameters(title: title, isMovie: false, index: 1, media: state.tvShows));
              },
            );
          }
          if (state is GetTrendingTvShowsLoadingState) {
            return const MediaLoadingList(title: title);
          }
          if (state is GetTrendingTvShowsErrorState) {
            return MediaErrorList(
                title: title,
                onPressed: () => TrendingTvShowCubit.get(context).getTrendingTvShowsData());
          }
          return Container();
        },
      ),
    );
  }
}