import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_horizontal_list_widgets/media_list_item/media_image_builder.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_horizontal_list_widgets/media_list_item/media_list_loading_item.dart';
class MediaListItem extends StatelessWidget {
  final Media media;
  final String mediaType;
  final String listType;
  const MediaListItem({super.key, required this.media,this.listType = '?',required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (listType == "?") {
            context.pushNamed(
                mediaType == AppStrings.movie || mediaType == "movies"
                    ? Routes.movieDetailsRoute
                    : Routes.tvShowDetailsRoute,
                extra: DetailsParams(
                    media: media,
                    listType: listType,
                    mediaType: (mediaType == AppStrings.movie || mediaType == "movies")
                            ? AppStrings.movie
                            : AppStrings.tv));
          } else {
            context.pushNamed(
                mediaType == AppStrings.movie || mediaType == "movies"
                    ? Routes.movieDetailsRoute
                    : Routes.tvShowDetailsRoute,
                extra: DetailsParams(
                    media: media,
                    listType:listType,
                    mediaType: (mediaType == AppStrings.movie || mediaType == "movies")
                            ? AppStrings.movie
                            : AppStrings.tv,
                    cubit: AccountListsCubit.get(context)));
          }
        },
        child: CachedNetworkImage(
            imageUrl: EndPoints.posterUrl(media.posterPath),
            imageBuilder: (context, imageProvider) => MediaImageBuilder(image: imageProvider),
            placeholder: (context, url) => const MediaListLoadingItem(),
            errorWidget: (context, url, error) => Image.asset(AppAssets.errorCover)));
  }
}
