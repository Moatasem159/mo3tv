import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_cubit/movie_buttons_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_cubit/movie_buttons_state.dart';
class MovieFavButton extends StatelessWidget {
  const MovieFavButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieButtonsCubit, MovieButtonsStates>(
      builder: (context, state) {
        MovieButtonsCubit cubit=MovieButtonsCubit.get(context);
        return MediaIconButton(
          onTap:() =>MovieButtonsCubit.get(context).markFav(cubit.movie!, context),
          icon: Icon(
              Icons.favorite_rounded,
              color:cubit.movie!.movieAccountDetails!.favorite!?Colors.red:Colors.white
          ),
        );
      },
    );
  }
}