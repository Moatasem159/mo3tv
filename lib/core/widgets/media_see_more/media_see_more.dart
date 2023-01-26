import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_state.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';

class MediaSeeMore extends StatelessWidget {
  final String title;
  final int index;
  final bool topRatedTvShows;
  final bool popularTvShows;
  final bool trendingTvShows;


  const MediaSeeMore({Key? key,
    required this.title,
    this.topRatedTvShows=false,
    this.popularTvShows=false,
    this.trendingTvShows=false, 
    required this.index,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            BlocProvider.of<MoreMoviesCubit>(context).page = 1;
            BlocProvider.of<MoreMoviesCubit>(context).moreMovies.clear();
            if (popularTvShows) {
              BlocProvider.of<TvCubit>(context).tvShowListPage = 1;
              BlocProvider.of<TvCubit>(context).seeMoreListTvShows.clear();
            }
            if (topRatedTvShows) {
              BlocProvider.of<TvCubit>(context).tvShowListPage = 1;
              BlocProvider.of<TvCubit>(context).seeMoreListTvShows.clear();
            }
            if (trendingTvShows) {
              BlocProvider.of<TvCubit>(context).tvShowListPage = 1;
              BlocProvider.of<TvCubit>(context).seeMoreListTvShows.clear();
            }
            Navigator.pop(context);
            return true;
          },
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      onPressed: () {
                        BlocProvider.of<MoreMoviesCubit>(context).page = 1;
                        BlocProvider.of<MoreMoviesCubit>(context).moreMovies.clear();
                        if (popularTvShows) {
                          BlocProvider.of<TvCubit>(context).tvShowListPage = 1;
                          BlocProvider.of<TvCubit>(context)
                              .seeMoreListTvShows
                              .clear();
                        }
                        if (topRatedTvShows) {
                          BlocProvider.of<TvCubit>(context).tvShowListPage = 1;
                          BlocProvider.of<TvCubit>(context)
                              .seeMoreListTvShows
                              .clear();
                        }
                        if (trendingTvShows) {
                          BlocProvider.of<TvCubit>(context).tvShowListPage = 1;
                          BlocProvider.of<TvCubit>(context)
                              .seeMoreListTvShows
                              .clear();
                        }
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  title: Text(title),
                  snap: true,
                  floating: true,
                  stretch: true,
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 7,
                  ),
                ),
                BlocBuilder<MoreMoviesCubit, MoreMoviesStates>(
                  builder: (context, state) {
                    MoreMoviesCubit cubit = BlocProvider.of<MoreMoviesCubit>(context);
                    return MoviesSeeMoreList(
                      movies: cubit.moreMovies,
                    );
                  },
                ),
                if (popularTvShows)
                  BlocBuilder<TvCubit, TvStates>(
                    builder: (context, state) {
                      TvCubit cubit = BlocProvider.of<TvCubit>(context);
                      return TvShowsSeeMoreList(
                          tvShows: cubit.seeMoreListTvShows);
                    },
                  ),
                if (topRatedTvShows)
                  BlocBuilder<TvCubit, TvStates>(
                    builder: (context, state) {
                      TvCubit cubit = BlocProvider.of<TvCubit>(context);
                      return TvShowsSeeMoreList(
                          tvShows: cubit.seeMoreListTvShows);
                    },
                  ),
                if (trendingTvShows)
                  BlocBuilder<TvCubit, TvStates>(
                    builder: (context, state) {
                      TvCubit cubit = BlocProvider.of<TvCubit>(context);
                      return TvShowsSeeMoreList(
                          tvShows: cubit.seeMoreListTvShows);
                    },
                  ),
                BlocBuilder<MoreMoviesCubit, MoreMoviesStates>(
              builder: (context, state) {
                if(state is GetMoreMoviesLoadingState)
                  {
                   return  SliverToBoxAdapter(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         children: const [
                           SizedBox(height: 5,),
                           SizedBox(
                             height: 35,
                             width: 35,
                             child: CircularProgressIndicator(
                               strokeWidth: 1.5,
                             ),
                           ),
                           SizedBox(height:5,),
                         ],
                       ),
                     ),
                   );
                  }
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text("Load more"),
                      onPressed: () {
                        BlocProvider.of<MoreMoviesCubit>(context)
                            .seeMoreMovies(index: index);
                        if (popularTvShows) {
                          BlocProvider.of<TvCubit>(context).tvShowListPage++;
                          BlocProvider.of<TvCubit>(context)
                              .getPopularTvShowsData(
                              seeMore: true,
                              page: BlocProvider.of<TvCubit>(context)
                                  .tvShowListPage);
                        }
                        if (topRatedTvShows) {
                          BlocProvider.of<TvCubit>(context).tvShowListPage++;
                          BlocProvider.of<TvCubit>(context)
                              .getTopRatedTvShowsData(
                              seeMore: true,
                              page: BlocProvider.of<TvCubit>(context)
                                  .tvShowListPage);
                        }
                        if (trendingTvShows) {
                          BlocProvider.of<TvCubit>(context).tvShowListPage++;
                          BlocProvider.of<TvCubit>(context)
                              .getTrendingTvShowsData(
                              seeMore: true,
                              page: BlocProvider.of<TvCubit>(context)
                                  .tvShowListPage);
                        }
                      },
                    ),
                  ),
                );

              },
            ),
          ],
            ),
          ),
        ));
  }
}
