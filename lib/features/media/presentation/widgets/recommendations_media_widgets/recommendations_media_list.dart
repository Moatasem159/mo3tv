import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_horizontal_list_widgets/media_list_item/media_list_item.dart';
class RecommendationsMediaList extends StatelessWidget {
  final List<Media> recommendationMedia;
  final MediaParams params;
  const RecommendationsMediaList({super.key, required this.recommendationMedia, required this.params});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Row(
          children: [
            Text(
                "${AppStrings.recommendations.tr(context)!} :${recommendationMedia.length}",
                style: AppLocalizations.of(context)!.isEnLocale
                    ? AppTextStyles.get14BoldText()
                    : AppTextStyles.get18BoldText()),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.pushNamed(params.mediaType == AppStrings.movie?Routes.similarMoviesRoute:Routes.similarTvShowRoute,
                        extra: recommendationMedia,
                        pathParameters: {"params": params.toJson()});
              },
              child: Row(
                children: [
                  Text(AppStrings.seeMore.tr(context)!,
                      style: AppLocalizations.of(context)!.isEnLocale
                          ? AppTextStyles.get14BoldText()
                          : AppTextStyles.get18BoldText()),
                  const Icon(Icons.arrow_forward_ios_outlined, size: 14)
                      .addPadding(t: 3)
                ],
              ),
            )
          ],
        ).addSymmetricPadding(h: 11),
        GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recommendationMedia.length,
            itemBuilder: (context, index) => MediaListItem(
                media: recommendationMedia[index], mediaType: params.mediaType),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .65, crossAxisCount: 3, mainAxisSpacing: 7)),
      ]),
    );
  }
}