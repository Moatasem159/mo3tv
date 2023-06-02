import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_state.dart';
import 'package:mo3tv/features/reviews/presentation/widgets/empty_review_widget.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
import 'package:mo3tv/features/reviews/presentation/widgets/review_widgets/review_list.dart';
import 'package:mo3tv/features/reviews/presentation/widgets/reviews_loading_widgets/reviews_loading_list.dart';
class MediaReviews extends StatelessWidget {
  const MediaReviews({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsStates>(
      builder: (context, state) {
        if (state is GetMediaReviewsSuccessState&&state.reviews.isEmpty) {
          return const ReviewEmptyWidget(msg: AppStrings.noReviews);
        }
        if (state is GetMediaReviewsSuccessState) {
          return MediaReviewsList(reviews: state.reviews);
        }
        if (state is GetMediaReviewsLoadingState) {
          return const ReviewsLoadingList();
        }
        if(state is GetMediaReviewsErrorState){
            return SliverToBoxAdapter(
              child: ErrorButton(onTap: (){
                ReviewsCubit.get(context).getMovieReviews(
                    mediaId:ReviewsCubit.get(context).mediaId!,
                    mediaType:ReviewsCubit.get(context).mediaType!);
              }),
            );
          }
        return const SliverToBoxAdapter();
      },
    );
  }
}