import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mo3tv/core/widgets/buttons.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';

class MovieRatingButton extends StatelessWidget {
  final Movie movie;
  const MovieRatingButton({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieCubit, MovieStates>(
      listener: (context, state) {
        if(state is RateMovieSuccessState)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 1500),
                  content:
                  Text("Movie rated successfully")));
        }
        if(state is RemoveRateMovieSuccessState)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 1500),
                  content:
                  Text("Rating removed successfully")));
        }
      },
      child: MediaIconButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                actionsPadding: const EdgeInsets.symmetric(horizontal: 5),
                elevation: 5,
                content: RatingBar(
                  itemSize: 27,
                  allowHalfRating: true,
                  glowRadius: 2,
                  initialRating:movie.movieAccountDetails!.ratedValue,
                  minRating: .5,
                  maxRating: 10,
                  itemCount: 10,
                  glowColor: Colors.yellow,
                  ratingWidget: RatingWidget(
                    full: const Icon(Icons.star, color: Colors.yellow),
                    empty: const Icon(Icons.star_border),
                    half: const Icon(Icons.star_half_outlined,
                        color: Colors.yellow),
                  ),
                  onRatingUpdate: (double value) {
                    movie.movieAccountDetails!.ratedValue = value;
                  },
                ),
                actions: [
                  IconButton(
                      tooltip: "remove rating",
                      iconSize: 25,
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        BlocProvider.of<MovieCubit>(context)
                            .removeRateMovie(movieId: movie.id!);
                        movie.movieAccountDetails!.ratedValue=0.0;
                        movie.movieAccountDetails!.watchlist = false;
                        Navigator.of(context).pop();
                      }),
                  TextButton(
                    child: const Text('Rate'),
                    onPressed: () {
                      if (movie.movieAccountDetails!.ratedValue != 0.0) {
                        BlocProvider.of<MovieCubit>(context)
                            .rateMovie(rate: movie.movieAccountDetails!.ratedValue, movieId: movie.id!);
                        movie.movieAccountDetails!.watchlist = false;
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        icon: movie.movieAccountDetails!.ratedValue!=0.0
            ? const Icon(
          Icons.star,
          color: Colors.yellow,
        )
            : const Icon(
          Icons.star_border,
        ) ,
      )
    );
  }
}
