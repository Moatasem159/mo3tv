import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_list_widget.dart';
class AccountMovieLists extends StatelessWidget {
  const AccountMovieLists({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.ph,
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(AppStrings.moviesLists.tr(context)!,style:AppTextStyles.get25BoldText())),
         SizedBox(
          height: 170,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            children:  const [
              AccountListWidget(
                listType: "rated",
                mediaType: "movies",
                icon: Icons.star_rate_rounded,
                image: AppAssets.movieCover,
                title: AppStrings.ratedMovies,
                iconColor: Colors.yellow,
              ),
              AccountListWidget(
                listType: "favorite",
                mediaType: "movies",
                icon: Icons.favorite_rounded,
                image: AppAssets.movieCover,
                title: AppStrings.favoriteMovies,
                iconColor: Colors.red,
              ),
              AccountListWidget(
                listType: "watchlist",
                mediaType: "movies",
                icon: Icons.bookmark_rounded,
                image: AppAssets.movieCover,
                title: AppStrings.moviesWatchList,
                iconColor: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}