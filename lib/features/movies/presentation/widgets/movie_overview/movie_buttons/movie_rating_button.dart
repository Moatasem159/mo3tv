import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_cubit/movie_buttons_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_cubit/movie_buttons_state.dart';
class MovieRatingButton extends StatelessWidget {
  const MovieRatingButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieButtonsCubit, MovieButtonsStates>(
      builder: (context, state) {
        MovieButtonsCubit cubit=MovieButtonsCubit.get(context);
        return Tooltip(
          message: "Rated${cubit.movie!.movieAccountDetails!.ratedValue}!",
          child: MediaIconButton(
            onTap: ()=>MovieButtonsCubit.get(context).rate(context,cubit.movie!,RatingBar(
              itemSize: 27,
              allowHalfRating: true,
              glowRadius: 2,
              initialRating: cubit.movie!.movieAccountDetails!.ratedValue,
              minRating: .5,
              maxRating: 10,
              itemCount: 10,
              glowColor: Colors.yellow,
              ratingWidget: RatingWidget(
                full: const Icon(Icons.star_rate_rounded, color: Colors.yellow),
                empty: const Icon(Icons.star_border_rounded),
                half: const Icon(Icons.star_half_rounded,
                    color: Colors.yellow),
              ),
              onRatingUpdate: (double value) {
                cubit.movie!.movieAccountDetails!.ratedValue = value;
              },
            )),
            icon: cubit.movie!.movieAccountDetails!.ratedValue != 0.0
                ? const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.yellow,
                     size: 30,
                  )
                : const Icon(
                    Icons.star_border_rounded,
                       size: 30,
                  ),
          ),
        );
      },
    );
  }
}