import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons.dart';
import 'package:mo3tv/core/widgets/playing_now_media/playing_now_media_loading_widget.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/playing_now_movies/playing_now_movie_list.dart';




class PlayingNowMovies extends SliverPersistentHeaderDelegate {
  final double maxSize = 300;
  final double minSize = 80;
  final double maxTitleSize = 24;
  final double minTitleSize = 16;
  final double maxPlayingSize = 20;
  final double minPlayingSize = 12;
  final double maxIconSize = 18;
  final double minIconSize = 12;
  final double maxImageSize = 350;
  final double minImageSize = 50;



  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    final p = shrinkOffset / maxSize;
    var size = MediaQuery
        .of(context)
        .size;
    final c = (maxImageSize * (1 - p)).clamp(minImageSize, maxImageSize);
    final titleSize =
    (maxTitleSize * (1 - p)).clamp(minTitleSize, maxTitleSize);
    final playingSize =
    (maxPlayingSize * (1 - p)).clamp(minPlayingSize, maxPlayingSize);
    final iconSize = (maxIconSize * (1 - p)).clamp(minIconSize, maxIconSize);
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if(state is GetNowPlayingMoviesLoadingState ||cubit.nowPlayingMovies == null) {
          return PlayingNowMediaLoadingWidget(height: c, width: size.width);
        }
        if(cubit.nowPlayingError!){
          return Container(
            color: Theme.of(context).backgroundColor,
            alignment: Alignment.center,
            height: c,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Something went wrong"),
                const SizedBox(
                  height: 7,
                ),
                MainButton(onPressed: (){
                  cubit.getNowPlayingMoviesData();
                }, label: "try again")
              ],
            ),

          );
        }
        if (cubit.nowPlayingMovies != null){
          return PlayingNowMoviesList(movies: cubit.nowPlayingMovies!,
              height: c,
              width: size.width,
              iconSize: iconSize,
              playingSize: playingSize,
              titleSize: titleSize);
        }
        return Container();
      },
    );
  }

  @override
  double get maxExtent => maxSize;

  @override
  double get minExtent => minSize;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}





