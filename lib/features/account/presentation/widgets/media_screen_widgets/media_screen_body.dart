import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_state.dart';
import 'package:mo3tv/features/account/presentation/widgets/media_screen_widgets/media_screen_appbar.dart';
import 'package:mo3tv/features/account/presentation/widgets/media_screen_widgets/movie_list.dart';
import 'package:mo3tv/features/account/presentation/widgets/media_screen_widgets/tv_list.dart';
class MediaScreenBody extends StatelessWidget {
  const MediaScreenBody({
    super.key,
    required this.title,
    required this.favMovies,
    required this.ratedMovies,
    required this.moviesWatchlist,
    required this.favTv,
    required this.ratedTv,
    required this.tvWatchlist,
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
    return BlocBuilder<AccountCubit, AccountStates>(
      builder: (context, state) {
        AccountCubit cubit =AccountCubit.get(context);
        return CustomScrollView(
          slivers: [
            MediaScreenAppBar(title: title),
            SliverToBoxAdapter(child: 7.ph),
            if(favMovies)
              MovieList(movieList: cubit.favMovies),
            if(ratedMovies)
              MovieList(movieList: cubit.ratedMovies),
            if(moviesWatchlist)
              MovieList(movieList: cubit.moviesWatchlist),
            if(favTv)
              TvList(tvList: cubit.favTvShows),
            if(ratedTv)
              TvList(tvList: cubit.ratedTvShows),
            if(tvWatchlist)
              TvList(tvList: cubit.tvShowsWatchlist),
              SliverToBoxAdapter(child: 10.ph)
          ],
        );
      },
    );
  }
}