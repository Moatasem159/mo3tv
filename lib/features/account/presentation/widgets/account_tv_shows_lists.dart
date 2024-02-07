part of'../screens/account_screen.dart';
class _AccountTvShowLists extends StatelessWidget {
  const _AccountTvShowLists();
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
              _AccountListWidget(
                mediaType: "tv",
                 listType: "rated",
                icon: Icons.star_rate_rounded,
                image: AppAssets.tvCover,
                title: AppStrings.ratedTvShows,
                iconColor: Colors.yellow,
              ),
              _AccountListWidget(
                listType: "favorite",
                 mediaType: "tv",
                icon: Icons.favorite_rounded,
                image: AppAssets.tvCover,
                title: AppStrings.favoriteTvShows,
                iconColor: Colors.red,
              ),
              _AccountListWidget(
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