import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/rate_movie_cubit/rate_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/rate_movie_cubit/rate_movie_state.dart';
class MovieRatingButton extends StatelessWidget {
  final Movie movie;
  const MovieRatingButton({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateMovieCubit, RateMovieStates>(
      builder: (context, state) {
        return Tooltip(
          message: "Rated${movie.movieAccountDetails!.ratedValue}!",
          child: MediaIconButton(
            onTap: ()=>RateMovieCubit.get(context).rate(context,movie,RatingBar(
              itemSize: 27,
              allowHalfRating: true,
              glowRadius: 2,
              initialRating: movie.movieAccountDetails!.ratedValue,
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
            )),
            icon: movie.movieAccountDetails!.ratedValue != 0.0
                ? const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : const Icon(
                    Icons.star_border,
                  ),
          ),
        );
      },
    );
  }
}