import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/credits/movie_credits_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/credits/movie_credits_loading_list.dart';

class MoviesCredits extends StatelessWidget {
  const MoviesCredits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if (cubit.movieCredits!.isNotEmpty) {
          return MovieCreditsList(movieCredits: cubit.movieCredits!);
        }
        if (state is GetMovieRecommendationsLoadingState || cubit.movieCredits!.isEmpty) {
          return const MovieCreditsLoadingList();
        }
        return SliverToBoxAdapter(
          child: Container(),
        );
      },
    );
  }
}




