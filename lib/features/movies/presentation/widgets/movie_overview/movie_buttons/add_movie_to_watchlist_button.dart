import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/add_watch_list_cubit/watch_list_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/add_watch_list_cubit/watch_list_movie_state.dart';
class AddMovieToWatchlistButton extends StatelessWidget {
  final Movie movie;
  const AddMovieToWatchlistButton({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListMovieCubit,WatchListMovieStates>(
      builder: (context, state) {
        return MediaIconButton(
          onTap: ()=>WatchListMovieCubit.get(context).add(context, movie),
          icon: movie.movieAccountDetails!.watchlist!
              ? const Icon(
            Icons.bookmark,
            color: Colors.green,
          )
              : const Icon(
            Icons.bookmark_add_outlined,
          ) ,
        );
      },
    );
  }
}