import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/core/widgets/buttons/see_more_button.dart';
import 'package:mo3tv/core/widgets/media_loading/sliver_loading_indicator.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_state.dart';
class SimilarTvShowButton extends StatelessWidget {
  const SimilarTvShowButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarTvShowCubit, SimilarTvShowStates>(
      builder: (context, state) {
        SimilarTvShowCubit cubit = SimilarTvShowCubit.get(context);
        if (state is GetSimilarTvShowLoadingState) {
          return const SliverLoadingIndicator();
        }
        if (state is GetSimilarTvShowSuccessState && cubit.allMovies) {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                10.ph,
                 Center(child: Text(AppStrings.noMore.tr(context)!,style: AppTextStyles.get14BoldText())),
                20.ph
              ],
            ),
          );
        }
        return SeeMoreButton(onPressed: () => cubit.getSimilarTvShows());
      },
    );
  }
}