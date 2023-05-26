import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_list_widget.dart';
class AccountTvShowLists extends StatelessWidget {
  const AccountTvShowLists({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.ph,
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Tv shows Lists",style: AppTextStyles.get25BoldText())),
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
                  image: AppStrings.tvCover,
                  title: "Rated tv shows",
                  iconColor: Colors.yellow,
                ),
                AccountListWidget(
                  listType: "favorite",
                   mediaType: "tv",
                  icon: Icons.favorite_rounded,
                  image: AppStrings.tvCover,
                  title: "Favorite tv shows",
                  iconColor: Colors.red,
                ),
                AccountListWidget(
                  listType: "watchlist",
                  mediaType: "tv",
                  icon: Icons.bookmark_rounded,
                  image: AppStrings.tvCover,
                  title: "Tv show watchlist",
                  iconColor: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}