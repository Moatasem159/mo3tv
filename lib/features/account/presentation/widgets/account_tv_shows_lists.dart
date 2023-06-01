import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_list_widget.dart';
class AccountTvShowLists extends StatelessWidget {
  const AccountTvShowLists({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.ph,
         Text(AppStrings.tvShowsLists.tr(context)!,style: AppTextStyles.get25BoldText()).addSymmetricPadding(h:20),
         SizedBox(
          height: 170,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            children: const [
              AccountListWidget(
                mediaType: "tv",
                 listType: "rated",
                icon: Icons.star_rate_rounded,
                image: AppAssets.tvCover,
                title: AppStrings.ratedTvShows,
                iconColor: Colors.yellow,
              ),
              AccountListWidget(
                listType: "favorite",
                 mediaType: "tv",
                icon: Icons.favorite_rounded,
                image: AppAssets.tvCover,
                title: AppStrings.favoriteTvShows,
                iconColor: Colors.red,
              ),
              AccountListWidget(
                listType: "watchlist",
                mediaType: "tv",
                icon: Icons.bookmark_rounded,
                image: AppAssets.tvCover,
                title: AppStrings.tvShowWatchlist,
                iconColor: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}