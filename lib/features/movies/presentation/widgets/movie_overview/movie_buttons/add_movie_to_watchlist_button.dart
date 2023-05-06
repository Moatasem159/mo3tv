import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons.dart';
import 'package:mo3tv/core/widgets/login_alert.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
class AddMovieToWatchlistButton extends StatelessWidget {
  final Movie movie;
  const AddMovieToWatchlistButton({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        return MediaIconButton(
          onTap: () {
            if(AppStrings.sessionId!='')
            {
              if (movie.movieAccountDetails!.watchlist!) {
                BlocProvider.of<MovieCubit>(context).addMovieToWatchList(movieId: movie.id!, watchlist: false);
                movie.movieAccountDetails!.watchlist=false;
                BlocProvider.of<AccountCubit>(context).moviesWatchlist.removeWhere((element) => element.id==movie.id,);
                BlocProvider.of<AccountCubit>(context).update();

              } else {
                BlocProvider.of<MovieCubit>(context).addMovieToWatchList(movieId: movie.id!, watchlist: true);
                movie.movieAccountDetails!.watchlist=true;
                BlocProvider.of<AccountCubit>(context).moviesWatchlist.add(movie);
                BlocProvider.of<AccountCubit>(context).update();
              }
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