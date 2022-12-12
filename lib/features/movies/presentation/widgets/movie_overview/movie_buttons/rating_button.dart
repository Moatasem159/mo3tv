import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/button.dart';

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
      child: MovieButton(
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
                  initialRating: BlocProvider.of<AccountCubit>(context)
                      .ratedMovies!
                      .any((element) => element.id! == movie.id!)
                      ? BlocProvider.of<AccountCubit>(context)
                      .ratedMovies!
                      .firstWhere((element) => element.id == movie.id)
                      .rating
                      : 0,
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
                    movie.rating = value;
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
                        BlocProvider.of<AccountCubit>(context)
                            .ratedMovies!
                            .removeWhere((element) => element.id == movie.id);
                        Navigator.of(context).pop();
                      }),
                  TextButton(
                    child: const Text('Rate'),
                    onPressed: () {
                      BlocProvider.of<MovieCubit>(context)
                          .rateMovie(rate: movie.rating, movieId: movie.id!);
                      if (movie.rating != 0) {
                        if (BlocProvider.of<AccountCubit>(context)
                            .ratedMovies!
                            .any((element) => element.id! == movie.id!)) {
                          BlocProvider.of<AccountCubit>(context)
                              .ratedMovies!
                              .firstWhere((element) => element.id == movie.id)
                              .rating = movie.rating;
                          movie.rating = 0;
                        } else if (!BlocProvider.of<AccountCubit>(context)
                            .ratedMovies!
                            .any((element) => element.id! == movie.id!)) {
                          BlocProvider.of<AccountCubit>(context)
                              .ratedMovies!
                              .add(MovieModel(
                              id: movie.id,
                              title: movie.title,
                              posterPath: movie.posterPath,
                              rating: movie.rating,
                              adult: false,
                              backdropPath: movie.backdropPath,
                              overview: movie.overview));
                          movie.rating = 0;
                        }
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        icon:BlocProvider.of<AccountCubit>(context)
            .ratedMovies!
            .any((element) => element.id! == movie.id!)
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
