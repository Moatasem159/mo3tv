import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/features/media/presentation/cubits/get_media_list_cubit/get_media_list_cubit.dart';
part 'media_playing_now_card.dart';
part 'media_playing_now_carousal.dart';
part 'playing_now_media_error_card.dart';
part 'playing_now_media_loading_card.dart';
part 'media_playing_now_card_builder.dart';
part 'playing_now_media_loading_carousal.dart';
class PlayingNowMedia extends StatelessWidget {
  final MediaParams params;
  const PlayingNowMedia({super.key,required this.params});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMediaListCubit(di.sl(),params)..getMediaList(),
      child: BlocBuilder<GetMediaListCubit, GetMediaListStates>(
        builder: (context, state) {
          if (state is GetMediaListLoadingState) {
            return const _PlayingNowMediaLoadingCarousal();
          }
          if (state is GetMediaListSuccessState) {
            return _MediaPlayingNowCarousal(media: state.media, isMovie: true);
          }
          if (state is GetMediaListErrorState) {
            return PlayingNowMediaErrorCard(onPressed: () => GetMediaListCubit.get(context).getMediaList());
          }
          return const SizedBox();
        },
      ),
    ).addPadding(t: 20, b: 10);
  }
}