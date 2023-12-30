import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/features/media/presentation/widgets/recommendations_media_widgets/empty_recommendations_media_widget.dart';
import 'package:mo3tv/features/media/presentation/widgets/recommendations_media_widgets/sliver_media_loading_list.dart';
import 'package:mo3tv/features/media/presentation/cubits/get_more_media_cubit/get_more_media_cubit.dart';
import 'package:mo3tv/features/media/presentation/widgets/recommendations_media_widgets/recommendations_media_list.dart';
class RecommendationsMedia extends StatelessWidget {
  final int mediaId;
  final String mediaType;
  const RecommendationsMedia({super.key, required this.mediaId, required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoreMediaCubit, GetMoreMediaStates>(
      builder: (context, state) {
        if (state is GetMoreMediaLoadingState) {
          return const SliverMediaLoadingList();
        }
        if (state is GetMoreMediaSuccessState && GetMoreMediaCubit.get(context).mediaList.isEmpty) {
          return const RecommendationsMediaEmptyWidget(
            msg: AppStrings.noRecommendations,
            icon: Icons.movie_filter_outlined,
          );
        }
        if (state is GetMoreMediaSuccessState) {
          return RecommendationsMediaList(
            recommendationMedia:GetMoreMediaCubit.get(context).mediaList,
            params: MediaParams(
            mediaId: mediaId,
            mediaType: mediaType,
            moreType: AppStrings.similar,
            listTitle: AppStrings.recommendations,
            listType: "none"
          ),);
        }
        if (state is GetMoreMediaErrorState) {
          return SliverToBoxAdapter(child: ErrorButton(onTap:GetMoreMediaCubit.get(context).getMoreMedia));
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
