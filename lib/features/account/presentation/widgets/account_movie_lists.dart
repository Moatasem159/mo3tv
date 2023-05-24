import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_list_widget.dart';
class AccountMovieLists extends StatelessWidget {
  const AccountMovieLists({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.ph,
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Movies Lists",style:AppTextStyles.get25BoldText())),

          SizedBox(
            height: 170,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              children: const [
                AccountListWidget(
                  ratedMovies: true,
                  icon: Icons.star_rate_rounded,
                  image: AppStrings.movieCover,
                  title: "Rated movies",
                  iconColor: Colors.yellow,
                ),
                AccountListWidget(
                  favMovies: true,
                  icon: Icons.favorite_rounded,
                  image: AppStrings.movieCover,
                  title: "Favorite movies",
                  iconColor: Colors.red,
                ),
                AccountListWidget(
                  moviesWatchlist: true,
                  icon: Icons.bookmark_rounded,
                  image: AppStrings.movieCover,
                  title: "Movies WatchList",
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