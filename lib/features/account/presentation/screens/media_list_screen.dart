import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list_item.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_list_item.dart';

class MediaListScreen extends StatelessWidget {
  final String title;
  final bool favMovies;
  final bool ratedMovies;
  final bool moviesWatchlist;
  final bool favTv;
  final bool ratedTv;
  final bool tvWatchlist;

  const MediaListScreen({
    Key? key,
    required this.title,
    required this.favMovies,
    required this.ratedMovies,
    required this.moviesWatchlist,
    required this.favTv,
    required this.ratedTv,
    required this.tvWatchlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountStates>(
      builder: (context, state) {
        AccountCubit cubit =BlocProvider.of<AccountCubit>(context);
        return SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                Navigator.pop(context);
                return true;
              },
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.background,
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      title: Text(title),
                      snap: true,
                      floating: true,
                      stretch: true,
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 7,),
                    ),
                    if(favMovies)
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: cubit.favMovies.length,
                              (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: MovieListItem(
                                  movie: cubit.favMovies[index]),
                            );
                          },
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .65,
                            crossAxisCount: 3,
                            mainAxisSpacing: 7),
                      ),
                    if(ratedMovies)
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: cubit.ratedMovies.length,
                              (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: MovieListItem(
                                  movie: cubit.ratedMovies[index]),
                            );
                          },
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .65,
                            crossAxisCount: 3,
                            mainAxisSpacing: 7),
                      ),
                    if(moviesWatchlist)
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: cubit.moviesWatchlist.length,
                              (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: MovieListItem(
                                  movie: cubit.moviesWatchlist[index]),
                            );
                          },
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .65,
                            crossAxisCount: 3,
                            mainAxisSpacing: 7),
                      ),
                    if(favTv)
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: cubit.favTvShows.length,
                              (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: TvShowListItem(
                                  tvShow: cubit.favTvShows[index]),
                            );
                          },
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .65,
                            crossAxisCount: 3,
                            mainAxisSpacing: 7),
                      ),
                    if(ratedTv)
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: cubit.ratedTvShows.length,
                              (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: TvShowListItem(
                                  tvShow: cubit.ratedTvShows[index]),
                            );
                          },
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .65,
                            crossAxisCount: 3,
                            mainAxisSpacing: 7),
                      ),
                    if(tvWatchlist)
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: cubit.tvShowsWatchlist.length,
                              (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: TvShowListItem(
                                  tvShow: cubit.tvShowsWatchlist[index]),
                            );
                          },
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .65,
                            crossAxisCount: 3,
                            mainAxisSpacing: 7),
                      ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
