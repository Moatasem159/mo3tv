import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/review/reviews_loading_widgets/movie_reviews_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/review/empty_review_widget.dart';
import 'package:mo3tv/core/widgets/review/review_widgets/movie_review_list.dart';


class MoviesReviews extends StatelessWidget {
  const MoviesReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if (cubit.movieReviews != null && cubit.movieReviews!.isNotEmpty) {
          return MediaReviewsList(reviews: cubit.movieReviews!,);
        }
        if (state is GetMovieReviewsLoadingState || cubit.movieReviews == null) {
          return  const ReviewsLoadingList();
        }
        if (state is GetMovieReviewsSuccessState && cubit.movieReviews != null && cubit.movieReviews!.isEmpty) {
          return const ReviewEmptyList();
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}











