import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/media_vertical_list/media_vertical_list.dart';
import 'package:mo3tv/core/widgets/media_vertical_list/sliver_loading_indicator.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/core/widgets/buttons/see_more_button.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_state.dart';
class MoreMovies extends StatelessWidget {
  final String title;
  final List media;
  final int index;
  final ScrollController ?controller;
  const MoreMovies({super.key, required this.title, required this.index, required this.media, this.controller});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      slivers: [
        CustomAppBar(
          title: title.tr(context)!,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        SliverToBoxAdapter(child: 7.ph),
        BlocBuilder<MoreMoviesCubit, MoreMoviesStates>(
          builder: (context, state) {
            MoreMoviesCubit cubit = MoreMoviesCubit.get(context);
            if(cubit.moreMovies.isEmpty)
              {
                cubit.moreMovies.addAll(media as List<Movie>);
              }
            return MediaVerticalList(mediaList: cubit.moreMovies,isMovie: true);
          },
        ),
        BlocBuilder<MoreMoviesCubit, MoreMoviesStates>(
          builder: (context, state) {
            if(state is GetMoreMoviesLoadingState)
            {
              return const SliverLoadingIndicator();
            }
            return SeeMoreButton(onPressed: () {
              MoreMoviesCubit.get(context).seeMoreMovies(index: index);
            });
          },
        ),
      ],
    );
  }
}