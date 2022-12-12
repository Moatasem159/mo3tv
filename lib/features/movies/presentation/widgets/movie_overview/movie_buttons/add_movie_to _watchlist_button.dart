import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_overview.dart';

class AddMovieToWatchlistButton extends StatelessWidget {
  final Movie movie;
  const AddMovieToWatchlistButton({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieCubit, MovieStates>(
      listener: (context, state) {
        if(state is AddToWatchListSuccessState &&state.statusCode==13)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 1500),
                  content:
                  Text("Removed from watchlist")));
        }
        else if(state is AddToWatchListSuccessState&& state.statusCode==1)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 1500),
                  content:
                  Text("Added to watchlist")));
        }
      },
      child: MovieButton(
        onTap: () {
          if (BlocProvider.of<AccountCubit>(context)
              .moviesWatchlist!
              .any((element) => element.id! == movie.id!)) {
            BlocProvider.of<MovieCubit>(context)
                .addToWatchList(movieId: movie.id!, watchlist: false);
            BlocProvider.of<AccountCubit>(context)
                .moviesWatchlist!
                .removeWhere(
                  (element) => element.id! == movie.id!,
            );
          } else {
            BlocProvider.of<MovieCubit>(context)
                .addToWatchList(movieId: movie.id!, watchlist: true);
            BlocProvider.of<AccountCubit>(context)
                .moviesWatchlist!
                .add(movie);
          }
        },
        icon: BlocProvider.of<AccountCubit>(context)
            .moviesWatchlist!
            .any((element) => element.id! == movie.id!)
            ? const Icon(
          Icons.bookmark,
          color: Colors.green,
        )
            : const Icon(
          Icons.bookmark_add_outlined,
        ) ,
      )
    );
  }
}
