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
    ScrollController controller=ScrollController();
    return SafeArea(
        child: WillPopScope(
          onWillPop: ()async{
            if(popularMovies)
            {
              BlocProvider.of<MovieCubit>(context).movieListPage=1;
              BlocProvider.of<MovieCubit>(context).popularMovies.clear();
              BlocProvider.of<MovieCubit>(context).getPopularMoviesData();
            }
            if(topRatedMovies)
            {
              BlocProvider.of<MovieCubit>(context).movieListPage=1;
              BlocProvider.of<MovieCubit>(context).topRatedMovies.clear();
              BlocProvider.of<MovieCubit>(context).getTopRatedMoviesData();
            }
            if(trendingMovies)
            {
              BlocProvider.of<MovieCubit>(context).movieListPage=1;
              BlocProvider.of<MovieCubit>(context).trendingMovies.clear();
              BlocProvider.of<MovieCubit>(context).getTrendingMoviesData();
            }
            if(popularTvShows)
            {
              BlocProvider.of<TvCubit>(context).tvShowListPage=1;
                BlocProvider.of<TvCubit>(context).popularTvShows.clear();
                BlocProvider.of<TvCubit>(context).getPopularTvShowsData();
              }
            if(topRatedTvShows)
            {
              BlocProvider.of<TvCubit>(context).tvShowListPage=1;
              BlocProvider.of<TvCubit>(context).topRatedTvShows.clear();
              BlocProvider.of<TvCubit>(context).getTopRatedTvShowsData();
            }
            if(trendingTvShows)
            {
              BlocProvider.of<TvCubit>(context).tvShowListPage=1;
              BlocProvider.of<TvCubit>(context).trendingTvShows.clear();
              BlocProvider.of<TvCubit>(context).getTrendingTvShowsData();
            }
            Navigator.pop(context);
            return true;
          },
          child: Scaffold(
              body: CustomScrollView(
                controller: controller,
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                        onPressed: (){
                          BlocProvider.of<MovieCubit>(context).movieListPage=1;
                          if(popularMovies)
                            {
                              BlocProvider.of<MovieCubit>(context).movieListPage=1;
                              BlocProvider.of<MovieCubit>(context).popularMovies.clear();
                              BlocProvider.of<MovieCubit>(context).getPopularMoviesData();
                            }
                          if(topRatedMovies)
                            {
                              BlocProvider.of<MovieCubit>(context).movieListPage=1;
                              BlocProvider.of<MovieCubit>(context).topRatedMovies.clear();
                              BlocProvider.of<MovieCubit>(context).getTopRatedMoviesData();
                            }
                          if(trendingMovies)
                          {
                            BlocProvider.of<MovieCubit>(context).movieListPage=1;
                            BlocProvider.of<MovieCubit>(context).trendingMovies.clear();
                            BlocProvider.of<MovieCubit>(context).getTrendingMoviesData();
                          }
                          if(popularTvShows)
                          {
                            BlocProvider.of<TvCubit>(context).tvShowListPage=1;
                            BlocProvider.of<TvCubit>(context).popularTvShows.clear();
                            BlocProvider.of<TvCubit>(context).getPopularTvShowsData();
                          }
                          if(topRatedTvShows)
                          {
                            BlocProvider.of<TvCubit>(context).tvShowListPage=1;
                            BlocProvider.of<TvCubit>(context).topRatedTvShows.clear();
                            BlocProvider.of<TvCubit>(context).getTopRatedTvShowsData();
                          }
                          if(trendingTvShows)
                          {
                            BlocProvider.of<TvCubit>(context).tvShowListPage=1;
                            BlocProvider.of<TvCubit>(context).trendingTvShows.clear();
                            BlocProvider.of<TvCubit>(context).getTrendingTvShowsData();
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
                      return MoviesSeeMoreList(movies: cubit.popularMovies,);
                    },
                  ),
                  if(topRatedMovies)
                  BlocBuilder<MovieCubit, MovieStates>(
                    builder: (context, state) {
                      MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
                      return MoviesSeeMoreList(movies: cubit.topRatedMovies,);
                    },
                  ),
                  if(trendingMovies)
                    BlocBuilder<MovieCubit, MovieStates>(
                      builder: (context, state) {
                        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
                        return MoviesSeeMoreList(movies: cubit.trendingMovies,);
                      },
                    ),
                  if(popularTvShows)
                  BlocBuilder<TvCubit, TvStates>(
                      builder: (context, state) {
                        TvCubit cubit = BlocProvider.of<TvCubit>(context);
                        return TvShowsSeeMoreList(tvShows: cubit.popularTvShows);
                      },
                    ),
                  if(topRatedTvShows)
                  BlocBuilder<TvCubit, TvStates>(
                      builder: (context, state) {
                        TvCubit cubit = BlocProvider.of<TvCubit>(context);
                        return TvShowsSeeMoreList(tvShows: cubit.topRatedTvShows);
                      },
                    ),
                  if(trendingTvShows)
                    BlocBuilder<TvCubit, TvStates>(
                      builder: (context, state) {
                        TvCubit cubit = BlocProvider.of<TvCubit>(context);
                        return TvShowsSeeMoreList(tvShows: cubit.trendingTvShows);
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
                                  page:BlocProvider.of<MovieCubit>(context).movieListPage);
                            }
                            if(topRatedMovies){
                              BlocProvider.of<MovieCubit>(context).movieListPage++;
                              BlocProvider.of<MovieCubit>(context).getTopRatedMoviesData(
                                  page:BlocProvider.of<MovieCubit>(context).movieListPage);
                            }
                            if(trendingMovies){
                              BlocProvider.of<MovieCubit>(context).movieListPage++;
                              BlocProvider.of<MovieCubit>(context).getTrendingMoviesData(
                                  page:BlocProvider.of<MovieCubit>(context).movieListPage);
                            }
                            if(popularTvShows){
                              BlocProvider.of<TvCubit>(context).tvShowListPage++;
                              BlocProvider.of<TvCubit>(context).getPopularTvShowsData(
                                  page:BlocProvider.of<TvCubit>(context).tvShowListPage);
                            }
                            if(topRatedTvShows){
                              BlocProvider.of<TvCubit>(context).tvShowListPage++;
                              BlocProvider.of<TvCubit>(context).getTopRatedTvShowsData(
                                  page:BlocProvider.of<TvCubit>(context).tvShowListPage);
                            }
                            if(trendingTvShows){
                              BlocProvider.of<TvCubit>(context).tvShowListPage++;
                              BlocProvider.of<TvCubit>(context).getTrendingTvShowsData(
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
