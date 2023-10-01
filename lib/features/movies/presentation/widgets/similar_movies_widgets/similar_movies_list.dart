import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_vertical_list/media_vertical_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_state.dart';
class SimilarMoviesList extends StatelessWidget {
  const SimilarMoviesList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMovieCubit, SimilarMovieStates>(
      builder: (context, state) {
        return MediaVerticalList(mediaList: SimilarMovieCubit.get(context).movies,isMovie: true);
      },
    );
  }
}