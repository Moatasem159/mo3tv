import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:shimmer/shimmer.dart';
class MediaSearchWidget extends StatelessWidget {
  final Search mediaSearch;
  const MediaSearchWidget({Key? key, required this.mediaSearch}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
        SearchListCubit.get(context).saveSearch(search: mediaSearch);
        if (mediaSearch.mediaType == AppStrings.movie) {
          Movie m = Movie(
            id: mediaSearch.id,
            name: mediaSearch.name,
            originalName: mediaSearch.originalTitle != "" ? mediaSearch.originalTitle : mediaSearch.originalName != "" ? mediaSearch.originalName : mediaSearch.name,
            posterPath: mediaSearch.posterPath,
            backdropPath: mediaSearch.backdropPath,
          );
          GoRouter.of(context).pushNamed(Routes.movieDetailsRoute,
              extra: m, pathParameters: {"listType": "?"});
        } else if (mediaSearch.mediaType == AppStrings.tv) {
          TvShow tv = TvShow(
            id: mediaSearch.id,
            originalName: mediaSearch.originalTitle != "" ? mediaSearch.originalTitle : mediaSearch.originalName != "" ? mediaSearch.originalName : mediaSearch.name,
            name: mediaSearch.name,
            posterPath: mediaSearch.posterPath,
            backdropPath: mediaSearch.backdropPath,
          );
          GoRouter.of(context).pushNamed(Routes.tvShowDetailsRoute,
              extra: tv, pathParameters: {"listType": "?"});
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black26,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 120,
              height: 180,
              imageUrl: EndPoints.posterUrl(mediaSearch.posterPath!),
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                );
              },
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            10.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${mediaSearch.originalTitle != "" ? mediaSearch.originalTitle : mediaSearch.originalName != "" ? mediaSearch.originalName : mediaSearch.name} ${mediaSearch.releaseDate == "" ? '' : ((mediaSearch.releaseDate!.substring(0, 4)))}",
                    style: AppTextStyles.get14BoldText(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  7.ph,
                  if (mediaSearch.voteAverage != 0)
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        5.pw,
                        Text(mediaSearch.voteAverage!.toStringAsFixed(1),
                            style: AppTextStyles.get14BoldText())
                      ],
                    ),
                  7.ph,
                  Row(
                    children: [
                      Text(mediaSearch.mediaType==AppStrings.movie?AppStrings.inMovies.tr(context)!:AppStrings.inTv.tr(context)!,
                          style: AppTextStyles.get14BoldText()),
                      5.pw,
                      Icon(
                              mediaSearch.mediaType == AppStrings.movie
                                  ? Icons.movie_filter_rounded
                                  : Icons.tv_rounded,
                              size: 18)
                          .addPadding(t: 4)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
