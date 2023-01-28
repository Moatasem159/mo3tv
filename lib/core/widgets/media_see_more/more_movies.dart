import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/widgets/media_see_more/movies_see_more_list.dart';
import 'package:mo3tv/core/widgets/media_see_more/see_more_app_bar.dart';
import 'package:mo3tv/core/widgets/media_see_more/see_more_button.dart';
import 'package:mo3tv/core/widgets/media_see_more/see_more_loading_indicator.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_state.dart';

class MoreMovies extends StatelessWidget {
  final String title;
  final int index;
  const MoreMovies({Key? key, required this.title, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SeeMoreAppBar(
          onPressed: () {
            BlocProvider.of<MoreMoviesCubit>(context).page = 1;
            BlocProvider.of<MoreMoviesCubit>(context).moreMovies.clear();
            GoRouter.of(context).pop();
          },
          title: title,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 7,
          ),
        ),
        BlocBuilder<MoreMoviesCubit, MoreMoviesStates>(
          builder: (context, state) {
            MoreMoviesCubit cubit = BlocProvider.of<MoreMoviesCubit>(context);
            return MoviesSeeMoreList(
              movies: cubit.moreMovies,
            );
          },
        ),
        BlocBuilder<MoreMoviesCubit, MoreMoviesStates>(
          builder: (context, state) {
            if(state is GetMoreMoviesLoadingState)
            {
              return const SeeMoreLoadingIndicator();
            }
            return SeeMoreButton(onPressed: () {
              BlocProvider.of<MoreMoviesCubit>(context)
                  .seeMoreMovies(index: index);
            },);
          },
        ),
      ],
    );
  }
}