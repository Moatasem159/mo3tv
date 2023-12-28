import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/get_movies_list_cubit/get_movies_list_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/get_movies_list_cubit/get_movies_list_states.dart';
class MoviesList extends StatelessWidget {
  final int index;
  final String title;
  final String listType;
  const MoviesList({super.key, required this.index, required this.title, required this.listType});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMoviesListCubit(di.sl(),listType)..getMoviesList(),
      child: BlocBuilder<GetMoviesListCubit, GetMoviesListStates>(
        builder: (context, state) {
          if (state is GetMoviesListLoadingState) {
            return  MediaLoadingList(title: title);
          }
          if (state is GetMoviesListSuccessState) {
            return MediaHorizontalList(
              media: state.movies, isMovie: true,
              title: title,
              onPressed: () {
                GoRouter.of(context).pushNamed(Routes.seeMoreMoviesRoute,
                    extra: SeeMoreParameters(title: title, isMovie: true, index: index,media: state.movies));
              },
            );
          }
          if (state is GetMoviesListErrorState) {
            return MediaErrorList(title: title,onPressed: () => GetMoviesListCubit.get(context).getMoviesList());
          }
          return const SizedBox();
        },
      ),
    );
  }
}