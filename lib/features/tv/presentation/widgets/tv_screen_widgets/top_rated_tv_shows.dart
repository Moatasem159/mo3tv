import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_loading_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/top_rated_tv_show_cubit/top_rated_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/top_rated_tv_show_cubit/top_rated_tv_show_state.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
class TopRatedTvShow extends StatelessWidget {
  const TopRatedTvShow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title = AppStrings.topRaredTvShows;
    return BlocProvider(
      create: (context) => TopRatedTvShowsCubit(di.sl())..getTopRatedTvShowsData(),
      child: BlocBuilder<TopRatedTvShowsCubit, TopRatedTvShowsStates>(
        builder: (context, state) {
          if (state is GetTopRatedTvShowsSuccessState) {
            return MediaHorizontalList(
              media: state.tvShows,
              isMovie: false,
              title: title,
              onPressed: () {
                GoRouter.of(context).pushNamed(Routes.seeMoreRoute,
                    extra: SeeMoreParameters(title: title, isMovie: false, index: 3, media: state.tvShows));
              },
            );
          }
          if (state is GetTopRatedTvShowsLoadingState) {
            return const MediaLoadingList(title: title);
          }
          if (state is GetTopRatedTvShowsErrorState) {
            return MediaErrorList(title: title,
                onPressed: () => TopRatedTvShowsCubit.get(context).getTopRatedTvShowsData());
          }
          return Container();
        },
      ),
    );
  }
}