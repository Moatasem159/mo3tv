import 'dart:math';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/widgets/read_more_widget.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/reviews/domain/entities/review.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
part '../widgets/media_reviews_list.dart';
part '../widgets/empty_review_widget.dart';
part '../widgets/review_widgets/review_image.dart';
part '../widgets/review_widgets/review_widget.dart';
part '../widgets/review_widgets/reviews_count.dart';
part '../widgets/review_widgets/review_details.dart';
part '../widgets/review_widgets/review_author_details.dart';
part '../widgets/reviews_loading_widgets/reviews_loading_list.dart';
part '../widgets/reviews_loading_widgets/review_loading_widget.dart';
class MediaReviews extends StatelessWidget {
  const MediaReviews({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsStates>(
      builder: (context, state) {
        if (state is GetMediaReviewsSuccessState&&state.reviews.isEmpty) {
          return const _ReviewEmptyWidget();
        }
        if (state is GetMediaReviewsSuccessState) {
          return _MediaReviewsList(reviews: state.reviews);
        }
        if(state is GetMediaReviewsErrorState){
            return SliverToBoxAdapter(child: ErrorButton(onTap:ReviewsCubit.get(context).getMediaReviews));
          }
        return const _ReviewsLoadingList();
      },
    );
  }
}