import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons/media_icon_button.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_alert.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_cubit/movie_buttons_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_cubit/movie_buttons_state.dart';
class MovieRatingButton extends StatelessWidget {
  final String listType;
  const MovieRatingButton({Key? key,this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieButtonsCubit, MovieButtonsStates>(
      builder: (context, state) {
        MovieButtonsCubit cubit=MovieButtonsCubit.get(context);
        return Tooltip(
          message: "Rated${cubit.movie!.movieAccountDetails!.ratedValue}!",
          child: MediaIconButton(
            onTap: (){
              if(AppStrings.sessionId!="")
              {
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
                      ),
                      actions: [
                        IconButton(
                          tooltip: "remove rating",
                          iconSize: 25,
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: (){
                            cubit.rate(0.0, context,listType);
                            GoRouter.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Rate'),
                          onPressed: (){
                            cubit.rate(cubit.movie!.movieAccountDetails!.ratedValue,context,listType);
                            GoRouter.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
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