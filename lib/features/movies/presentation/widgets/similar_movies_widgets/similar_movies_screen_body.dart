import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/similar_movies_widgets/similar_movies_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/similar_movies_widgets/similar_movies_list.dart';
class SimilarMoviesScreenBody extends StatelessWidget {
  final List<Movie> recommendations;
  final int movieId;
  const SimilarMoviesScreenBody({super.key, required this.recommendations,required this.movieId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<SimilarMovieCubit>(),
      child: CustomScrollView(
        slivers: [
          CustomAppBar(
            onPressed: ()=>GoRouter.of(context).pop(),
            title: AppStrings.recommendations),
          SliverToBoxAdapter(child: 5.ph),
          SimilarMoviesList(recommendations: recommendations),
          SimilarMoviesButton(movieId: movieId),
        ],
      ),
    );
  }
}