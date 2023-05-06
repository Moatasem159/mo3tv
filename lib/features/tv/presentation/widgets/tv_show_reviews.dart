import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/review/empty_review_widget.dart';
import 'package:mo3tv/core/widgets/review/reviews_loading_widgets/movie_reviews_loading_list.dart';
import 'package:mo3tv/core/widgets/review/review_widgets/movie_review_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvShowsReviews extends StatelessWidget {
  const TvShowsReviews({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        TvCubit cubit =TvCubit.get(context);
        if (cubit.tvShowsReviews != null && cubit.tvShowsReviews!.isNotEmpty) {
          return MediaReviewsList(reviews: cubit.tvShowsReviews!,);
        }
        if (state is GetTvShowReviewsLoadingState || cubit.tvShowsReviews == null) {
          return  const ReviewsLoadingList();
        }
        if (state is GetTvShowReviewsSuccessState && cubit.tvShowsReviews != null && cubit.tvShowsReviews!.isEmpty) {
          return const ReviewEmptyWidget(msg: "No reviews on this series",);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}