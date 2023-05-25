import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_alert.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_cubit/movie_buttons_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_cubit/movie_buttons_state.dart';
class AddMovieToWatchlistButton extends StatelessWidget {
  final String listType;
  const AddMovieToWatchlistButton({Key? key,this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieButtonsCubit,MovieButtonsStates>(
      builder: (context, state) {
        MovieButtonsCubit cubit=MovieButtonsCubit.get(context);
        return MediaIconButton(
          onTap: (){
            if(AppStrings.sessionId!='')
            {
              cubit.addToWatchlist(context,listType);
            }
            else{
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return const LoginAlert();
                },
              );
            }
          },
          icon: cubit.movie!.movieAccountDetails!.watchlist!
              ? const Icon(Icons.bookmark_rounded, color: Colors.green)
              : const Icon(Icons.bookmark_add_outlined),
        );
      },
    );
  }
}