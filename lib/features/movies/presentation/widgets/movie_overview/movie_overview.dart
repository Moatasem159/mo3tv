import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_details_loading_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_buttons.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_details.dart';


class MovieOverview extends StatelessWidget {
  const MovieOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if (state is GetMovieDetailsSuccessState ||
            cubit.movie != Movie()) {
          return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieDetails(
                      movie: cubit.movie,
                    ),
                    MovieButtons(movie: cubit.movie),
                    MovieDescription(
                      movie: cubit.movie,
                      keywords: cubit.movieKeywords,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                  ],
                ),
              ));
        }
        if (state is GetMovieDetailsLoadingState ||
            cubit.movie == Movie()) {
          return const MovieDetailsLoadingWidget();
        }
        return const SizedBox();
      },
    );
  }
}







