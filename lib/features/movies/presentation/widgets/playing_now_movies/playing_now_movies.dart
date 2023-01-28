import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/playing_now_movies/playing_now_movie_list.dart';
class PlayingNowMoviesWidget extends StatelessWidget {
  const PlayingNowMoviesWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayingNowMovieCubit, PlayingNowMovieStates>(
      builder: (context, state) {
        if(state is GetNowPlayingMoviesSuccessState)
        {
          return PlayingNowMoviesCarousal(movies: state.nowPlayingMovies,);
        }
        if(state is GetNowPlayingMoviesLoadingState)
          {
            return const PlayingNowMoviesLoadingCarousal();
          }
        if(state is GetNowPlayingMoviesErrorState)
          {
            return Center(
              child: Container(
                height: MediaQuery.of(context).size.height/3.5,
                width: MediaQuery.of(context).size.width-50,
                decoration: BoxDecoration(
                  color:Colors.grey[700],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Something went wrong"),
                    const SizedBox(
                      height: 7,
                    ),
                    MainButton(onPressed:() {
                      BlocProvider.of<PlayingNowMovieCubit>(context).getNowPlayingMoviesData();
                    }, label: "try again")
                  ],
                ),
              ),
            );
          }
        return Container();
      },
    );
  }
}