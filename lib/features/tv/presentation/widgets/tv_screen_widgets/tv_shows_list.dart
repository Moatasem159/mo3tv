import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_loading_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/get_tv_shows_list_cubit/get_tv_shows_list_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/get_tv_shows_list_cubit/get_tv_shows_list_state.dart';
class TvShowsList extends StatelessWidget {
  final String title;
  final String listType;
  final int index;
  const TvShowsList({super.key, required this.title, required this.listType, required this.index});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTvShowsListCubit(di.sl(),listType)..getNowPlayingTvShowsData(),
      child: BlocBuilder<GetTvShowsListCubit, GetTvShowsListStates>(
        builder: (context, state) {
          if (state is GetTvShowsListSuccessState) {
            return MediaHorizontalList(
              media: state.tvShows,
              isMovie: false,
              title: title,
              onPressed: () {
                GoRouter.of(context).pushNamed(Routes.seeMoreTvSHowRoute, extra: SeeMoreParameters(title: title, isMovie: false, index: index, media: state.tvShows));
              },
            );
          }
          if (state is GetTvShowsListLoadingState) {
            return  MediaLoadingList(title: title);
          }
          if (state is GetTvShowsListErrorState) {
            return MediaErrorList(
                title: title,
                onPressed: () => GetTvShowsListCubit.get(context).getNowPlayingTvShowsData());
          }
          return const SizedBox();
        },
      ),
    );
  }
}