import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/presentation/cubits/get_media_details_cubit/get_media_details_cubit.dart';
import 'package:mo3tv/features/media/presentation/cubits/media_buttons_bloc/media_actions_bloc.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/movie_info_widgets/movie_overview_success_body.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/tv_show_info_widgets/tv_show_overview_success_body.dart';
part 'media_details_loading.dart';
part 'media_details_error.dart';
class MediaOverview extends StatelessWidget {
  final Media movie;
  final MediaParams params;
  const MediaOverview({super.key, required this.movie, required this.params});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailsCubit, GetMediaDetailsStates>(
      builder: (context, state) {
        if (state is GetMediaDetailsLoadingState) {
          return _MediaDetailsLoading(mediaType: params.mediaType);
        }
        if (state is GetMediaDetailsSuccessState) {

          if(params.mediaType==AppStrings.movie) {
            MediaActionsBloc.get(context).media = GetMediaDetailsCubit.get(context).movie;
            return MovieOverViewSuccessBody(
              listType: params.listType,
              movie: GetMediaDetailsCubit.get(context).movie);
          }
          else if (params.mediaType==AppStrings.tv){
            MediaActionsBloc.get(context).media = GetMediaDetailsCubit.get(context).tvShow;
            return TvShowOverviewSuccessBody(listType:  params.listType, tvShow: GetMediaDetailsCubit.get(context).tvShow);
          }
        }
        if (state is GetMediaDetailsErrorState) {
          return const _MediaDetailsError();
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}




