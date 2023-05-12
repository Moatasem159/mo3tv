import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/add_fav_movie_cubit/add_fav_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/add_fav_movie_cubit/add_fav_movie_state.dart';
class MovieFavButton extends StatelessWidget {
  final Movie movie;
  const MovieFavButton({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFavMovieCubit, AddFavMovieStates>(
      builder: (context, state) {
        return MediaIconButton(
          onTap:() =>AddFavMovieCubit.get(context).markFav(movie, context),
          icon: Icon(
              Icons.favorite,
              color:movie.movieAccountDetails!.favorite!?Colors.red:Colors.white
          ),
        );
      },
    );
  }
}