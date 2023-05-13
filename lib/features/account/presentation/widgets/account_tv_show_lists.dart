import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Tv shows Lists",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
            )),
          ),
          10.ph,
          SizedBox(
            height: 170,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              children: const [
                AccountListWidget(
                  ratedTv: true,
                  icon: Icons.star_rate_rounded,
                  image: AppStrings.tvCover,
                  title: "Rated tv shows",
                  iconColor: Colors.yellow,
                ),
                AccountListWidget(
                  favTv: true,
                  icon: Icons.favorite_rounded,
                  image: AppStrings.tvCover,
                  title: "Favorite tv shows",
                  iconColor: Colors.red,
                ),
                AccountListWidget(
                  tvWatchlist: true,
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