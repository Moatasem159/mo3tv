import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';

class MediaSeeMore extends StatelessWidget {
  final String title;
  final bool popularMovies;
  final bool topRatedMovies;
  final bool topRatedTvShows;
  final bool popularTvShows;
  final bool trendingTvShows;
  final bool trendingMovies;

  const MediaSeeMore({Key? key,
    required this.title,
    this.popularMovies=false,
this.topRatedMovies=false,
 this.topRatedTvShows=false,
     this.popularTvShows=false,
     this.trendingTvShows=false,
     this.trendingMovies=false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop: ()async{
            if(popularMovies)
            {
              BlocProvider.of<MovieCubit>(context).movieListPage=1;
              BlocProvider.of<MovieCubit>(context).seeMoreListMovies.clear();
            }
            if(topRatedMovies)
            {
              BlocProvider.of<MovieCubit>(context).movieListPage=1;
              BlocProvider.of<MovieCubit>(context).seeMoreListMovies.clear();
            }
            if(trendingMovies)
            {
              BlocProvider.of<MovieCubit>(context).movieListPage=1;
              BlocProvider.of<MovieCubit>(context).seeMoreListMovies.clear();
            }
            if(popularTvShows)
            {
              BlocProvider.of<TvCubit>(context).tvShowListPage=1;
              BlocProvider.of<TvCubit>(context).seeMoreListTvShows.clear();
              }
            if(topRatedTvShows)
            {
              BlocProvider.of<TvCubit>(context).tvShowListPage=1;
              BlocProvider.of<TvCubit>(context).seeMoreListTvShows.clear();
            }
            if(trendingTvShows)
            {
              BlocProvider.of<TvCubit>(context).tvShowListPage=1;
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
                        onPressed: (){
                          BlocProvider.of<MovieCubit>(context).movieListPage=1;
                          if(popularMovies)
                            {
                              BlocProvider.of<MovieCubit>(context).movieListPage=1;
                              BlocProvider.of<MovieCubit>(context).seeMoreListMovies.clear();
                            }
                          if(topRatedMovies)
                            {
                              BlocProvider.of<MovieCubit>(context).movieListPage=1;
                              BlocProvider.of<MovieCubit>(context).seeMoreListMovies.clear();
                            }
                          if(trendingMovies)
                          {
                            BlocProvider.of<MovieCubit>(context).movieListPage=1;
                            BlocProvider.of<MovieCubit>(context).seeMoreListMovies.clear();
                          }
                          if(popularTvShows)
                          {
                            BlocProvider.of<TvCubit>(context).tvShowListPage=1;
                            BlocProvider.of<TvCubit>(context).seeMoreListTvShows.clear();
                          }
                          if(topRatedTvShows)
                          {
                            BlocProvider.of<TvCubit>(context).tvShowListPage=1;
                            BlocProvider.of<TvCubit>(context).seeMoreListTvShows.clear();
                          }
                          if(trendingTvShows)
                          {
                            BlocProvider.of<TvCubit>(context).tvShowListPage=1;
                            BlocProvider.of<TvCubit>(context).seeMoreListTvShows.clear();
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
                    child: SizedBox(height: 7,),
                  ),
                  if(popularMovies)
                  BlocBuilder<MovieCubit, MovieStates>(
                    builder: (context, state) {
                      MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
                      return MoviesSeeMoreList(movies: cubit.seeMoreListMovies,);
                    },
                  ),
                  if(topRatedMovies)
                  BlocBuilder<MovieCubit, MovieStates>(
                    builder: (context, state) {
                      MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
                      return MoviesSeeMoreList(movies: cubit.seeMoreListMovies,);
                    },
                  ),
                  if(trendingMovies)
                    BlocBuilder<MovieCubit, MovieStates>(
                      builder: (context, state) {
                        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
                        return MoviesSeeMoreList(movies: cubit.seeMoreListMovies,);
                      },
                    ),
                  if(popularTvShows)
                  BlocBuilder<TvCubit, TvStates>(
                      builder: (context, state) {
                        TvCubit cubit = BlocProvider.of<TvCubit>(context);
                        return TvShowsSeeMoreList(tvShows: cubit.seeMoreListTvShows);
                      },
                    ),
                  if(topRatedTvShows)
                  BlocBuilder<TvCubit, TvStates>(
                      builder: (context, state) {
                        TvCubit cubit = BlocProvider.of<TvCubit>(context);
                        return TvShowsSeeMoreList(tvShows: cubit.seeMoreListTvShows);
                      },
                    ),
                  if(trendingTvShows)
                    BlocBuilder<TvCubit, TvStates>(
                      builder: (context, state) {
                        TvCubit cubit = BlocProvider.of<TvCubit>(context);
                        return TvShowsSeeMoreList(tvShows: cubit.seeMoreListTvShows);
                      },
                    ),
                  SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Load more"),
                          onPressed: () {
                            if(popularMovies){
                              BlocProvider.of<MovieCubit>(context).movieListPage++;
                              BlocProvider.of<MovieCubit>(context).getPopularMoviesData(
                                  seeMore: true,
                                  page:BlocProvider.of<MovieCubit>(context).movieListPage);
                            }
                            if(topRatedMovies){
                              BlocProvider.of<MovieCubit>(context).movieListPage++;
                              BlocProvider.of<MovieCubit>(context).getTopRatedMoviesData(
                                seeMore: true,
                                  page:BlocProvider.of<MovieCubit>(context).movieListPage);
                            }
                            if(trendingMovies){
                              BlocProvider.of<MovieCubit>(context).movieListPage++;
                              BlocProvider.of<MovieCubit>(context).getTrendingMoviesData(
                                seeMore: true,
                                  page:BlocProvider.of<MovieCubit>(context).movieListPage);
                            }
                            if(popularTvShows){
                              BlocProvider.of<TvCubit>(context).tvShowListPage++;
                              BlocProvider.of<TvCubit>(context).getPopularTvShowsData(
                                  seeMore: true,
                                  page:BlocProvider.of<TvCubit>(context).tvShowListPage);
                            }
                            if(topRatedTvShows){
                              BlocProvider.of<TvCubit>(context).tvShowListPage++;
                              BlocProvider.of<TvCubit>(context).getTopRatedTvShowsData(
                                seeMore: true,
                                  page:BlocProvider.of<TvCubit>(context).tvShowListPage);
                            }
                            if(trendingTvShows){
                              BlocProvider.of<TvCubit>(context).tvShowListPage++;
                              BlocProvider.of<TvCubit>(context).getTrendingTvShowsData(
                                  seeMore: true,
                                  page:BlocProvider.of<TvCubit>(context).tvShowListPage);
                            }
                          },
                        ),
                      ),
              ),
                ],
              ),
          ),
        ));
  }
}
