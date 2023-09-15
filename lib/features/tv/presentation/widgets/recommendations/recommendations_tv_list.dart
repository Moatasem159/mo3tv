import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_list.dart';
class RecommendationsTvShowsList extends StatelessWidget {
  final List<TvShow> recommendationTvShows;
  final int tvId;
  const RecommendationsTvShowsList({Key? key, required this.recommendationTvShows, required this.tvId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${AppStrings.recommendations.tr(context)!} :${recommendationTvShows.length}",
                        style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()).addSymmetricPadding(h: 11),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                            Routes.similarTvShowsRoute,
                            extra: recommendationTvShows,
                            pathParameters: {'tvId': tvId.toString()});
                      },
                      child:Row(
                        children: [
                          Text(AppStrings.seeMore.tr(context)!, style: AppLocalizations.of(context)!.isEnLocale?AppTextStyles.get14BoldText():AppTextStyles.get18BoldText()),
                          const Icon(Icons.arrow_forward_ios_outlined,size: 15).addPadding(t: 3)
                        ],
                      ).addSymmetricPadding(h: 10),
                    )
                  ],
                ),
              10.ph
              ],
            ),
          ),
          TvList(tvList: recommendationTvShows),
          SliverToBoxAdapter(child: 10.ph)
        ],
      ),
    );
  }
}