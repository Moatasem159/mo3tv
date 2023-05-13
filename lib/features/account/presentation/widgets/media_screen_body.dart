import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/custom_app_bar.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_lists/movies_lists/account_fav_movies_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_lists/movies_lists/account_movies_watchlist.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_lists/movies_lists/account_rated_movies_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_lists/tv_lists/account_fav_tv_show_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_lists/tv_lists/account_rated_tv_show_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/account_lists/tv_lists/account_tv_show_watchlist.dart';
class MediaScreenBody extends StatelessWidget {
  const MediaScreenBody({
    super.key,
    required this.title,
    this.favMovies=false,
     this.ratedMovies=false,
     this.moviesWatchlist=false,
     this.favTv=false,
     this.ratedTv=false,
     this.tvWatchlist=false,
  });
  final String title;
  final bool favMovies;
  final bool ratedMovies;
  final bool moviesWatchlist;
  final bool favTv;
  final bool ratedTv;
  final bool tvWatchlist;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: title,onPressed:()=>GoRouter.of(context).pop()),
        SliverToBoxAdapter(child: 7.ph),
        if(favMovies)
          const AccountFavMoviesList(),
        if(ratedMovies)
          const AccountRatedMoviesList(),
        if(moviesWatchlist)
          const AccountMoviesWatchlist(),
        if(favTv)
          const AccountFavTvShowsList(),
        if(ratedTv)
          const AccountRatedTvShowsList(),
        if(tvWatchlist)
          const AccountTvShowsWatchlist(),
        SliverToBoxAdapter(child: 10.ph)
      ],
    );
  }
}