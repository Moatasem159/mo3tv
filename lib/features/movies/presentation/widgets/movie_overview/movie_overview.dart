import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_overview_success_body.dart';
class MovieOverview extends StatelessWidget {
  final String listType;
  final Movie movie;
  const MovieOverview({super.key,this.listType = '', required this.movie});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
        builder: (context, state) {
          if (state is GetMovieDetailsLoadingState){
            return SliverToBoxAdapter(
                child: Center(child:
                Lottie.asset(AppAssets.movieLoading,height: 80)));
          }
          if(state is GetMovieDetailsSuccessState){
            MovieActionsBloc.get(context).movie=state.movie;
            return MovieOverViewSuccessBody(listType: listType,movie: state.movie);
          }
          if(state is GetMovieDetailsErrorState) {
              return SliverToBoxAdapter(child: ErrorButton(onTap: () =>
                  MovieCubit.get(context).getMovieDetailsData(movieId: movie.id)));
            }
           return const SliverToBoxAdapter();
        },
      );
  }
}