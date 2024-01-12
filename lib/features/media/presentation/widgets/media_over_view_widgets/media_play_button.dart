import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/presentation/cubits/get_media_details_cubit/get_media_details_cubit.dart';
import 'package:mo3tv/features/media/presentation/cubits/media_bottomnav_cubit/media_bottom_nav_cubit.dart';
import 'package:mo3tv/features/media/presentation/widgets/trailer_widgets/play_button_widget.dart';
class MediaPlayButton extends StatelessWidget {
  final double shrinkOffset;
  final String mediaType;
  const MediaPlayButton({super.key, required this.shrinkOffset,required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaBottomNavCubit, MediaBottomNavStates>(
      builder: (context, state) {
        if (MediaBottomNavCubit.get(context).index == 0) {
          return BlocBuilder<GetMediaDetailsCubit, GetMediaDetailsStates>(
            builder: (context, state) {
              if (state is GetMediaDetailsSuccessState) {
                if (mediaType==AppStrings.movie) {
                  if (GetMediaDetailsCubit.get(context).movie.trailer != null) {
                    return PlayButtonWidget(
                      url: GetMediaDetailsCubit.get(context).movie.trailer!.key,
                      name:
                          GetMediaDetailsCubit.get(context).movie.trailer!.name,
                      shrinkOffset: shrinkOffset,
                    );
                  }
                }else {
                  if (GetMediaDetailsCubit.get(context).tvShow.trailer != null) {
                    return PlayButtonWidget(
                      url: GetMediaDetailsCubit.get(context).tvShow.trailer!.key,
                      name:
                      GetMediaDetailsCubit.get(context).tvShow.trailer!.name,
                      shrinkOffset: shrinkOffset,
                    );
                  }
                }
              }
              return const SizedBox();
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
