import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/presentation/widgets/playing_now_movies/playing_now_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/popular_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/top_rated_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/trending_movies.dart';
class MoviesScreenBody extends StatelessWidget {
  const MoviesScreenBody({Key? key}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children:const[

          SizedBox(height: 30,),
          PlayingNowMoviesWidget(),
          SizedBox(height: 15,),
          TrendingMovies(),
          PopularMovies(),
          TopRatedMovies(),
          SizedBox(height:70,),
        ],
      ),
    );
  }
}