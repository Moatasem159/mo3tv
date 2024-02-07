part of'../screens/account_screen.dart';
class _AccountMovieLists extends StatelessWidget {
  const _AccountMovieLists();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.ph,
         Text(AppStrings.moviesLists.tr(context)!,style:AppTextStyles.get25BoldText()).addSymmetricPadding(h:20),
         SizedBox(
          height: 170,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            children:  const [
              _AccountListWidget(
                listType: "rated",
                mediaType: "movies",
                icon: Icons.star_rate_rounded,
                image: AppAssets.movieCover,
                title: AppStrings.ratedMovies,
                iconColor: Colors.yellow,
              ),
              _AccountListWidget(
                listType: "favorite",
                mediaType: "movies",
                icon: Icons.favorite_rounded,
                image: AppAssets.movieCover,
                title: AppStrings.favoriteMovies,
                iconColor: Colors.red,
              ),
              _AccountListWidget(
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