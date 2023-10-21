import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_loading_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/popular_tv_show_cubit/popular_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/popular_tv_show_cubit/popular_tv_show_state.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
class PopularTvShow extends StatelessWidget {
  const PopularTvShow({super.key});
  @override
  Widget build(BuildContext context) {
    const String title = AppStrings.popularTvShows;
    return BlocProvider(
      create: (context) => PopularTvShowCubit(di.sl())..getPopularTvShowsData(),
      child: BlocBuilder<PopularTvShowCubit, PopularTvShowStates>(
        builder: (context, state) {
          if (state is GetPopularTvShowsSuccessState) {
            return MediaHorizontalList(
              media: state.tvShows,
              isMovie: false,
              title: title,
              onPressed: () {
                GoRouter.of(context).pushNamed(Routes.seeMoreRoute, extra: SeeMoreParameters(title: title, isMovie: false, index: 2, media: state.tvShows));
              },
            );
          }
          if (state is GetPopularTvShowsLoadingState) {
            return const MediaLoadingList(title: title);
          }
          if (state is GetPopularTvShowsErrorState) {
            return MediaErrorList(
                title: title,
                onPressed: () => PopularTvShowCubit.get(context).getPopularTvShowsData());
          }
          return Container();
        },
      ),
    );
  }
}