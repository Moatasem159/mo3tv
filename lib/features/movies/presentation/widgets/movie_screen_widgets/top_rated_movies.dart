import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_state.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});
  @override
  Widget build(BuildContext context) {
    const String title=AppStrings.topRatedMovies;
    return BlocProvider(
      create: (context) => TopRatedMoviesCubit(di.sl())..getTopRatedMoviesData(),
      child: BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesStates>(
        builder: (context, state) {
          if (state is GetTopRatedMoviesSuccessState) {
            return MediaHorizontalList(
              media: state.movies,
              isMovie: true,
              title: title,
              onPressed: () {
                GoRouter.of(context).pushNamed(Routes.seeMoreMoviesRoute,
                    extra: SeeMoreParameters(
                        title: title,
                        isMovie: true,
                        index: 3,
                        media: state.movies));
              },
            );
          }
          if (state is GetTopRatedMoviesLoadingState) {
            return const MediaLoadingList(title: title);
          }
          if (state is GetTopRatedMoviesErrorState) {
            return MediaErrorList(
                title: title,
                onPressed: () =>
                    TopRatedMoviesCubit.get(context).getTopRatedMoviesData());
          }
          return Container();
        },
      ),
    );
  }
}