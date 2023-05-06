import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/buttons.dart';
import 'package:mo3tv/core/widgets/login_alert.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvShowRatingButton extends StatelessWidget {
  final TvShow tvShow;
  const TvShowRatingButton({Key? key, required this.tvShow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        TvCubit cubit=TvCubit.get(context);
        return Tooltip(
          message:"Rated${tvShow.tvShowAccountDetails!.ratedValue}!" ,
          child: MediaIconButton(
            onTap: () {
              if(AppStrings.sessionId!='')
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
                        initialRating: tvShow.tvShowAccountDetails!.ratedValue,
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
                          tvShow.tvShowAccountDetails!.ratedValue = value;
                        },
                      ),
                      actions: [
                        IconButton(
                            tooltip: "remove rating",
                            iconSize: 25,
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              BlocProvider.of<TvCubit>(context)
                                  .removeTvShowRate(tvId: tvShow.id!);
                              tvShow.tvShowAccountDetails!.ratedValue=0.0;
                              tvShow.tvShowAccountDetails!.watchlist = false;
                              AccountCubit.get(context).ratedTvShows.removeWhere((element) =>element.id==tvShow.id);
                              AccountCubit.get(context).tvShowsWatchlist.removeWhere((element) => element.id==tvShow.id,);
                              AccountCubit.get(context).update();
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                          child: const Text('Rate'),
                          onPressed: () {
                            if (tvShow.tvShowAccountDetails!.ratedValue != 0.0) {
                              cubit.rateTvShow(rate: tvShow.tvShowAccountDetails!.ratedValue, tvId: tvShow.id!);
                              tvShow.tvShowAccountDetails!.watchlist = false;
                              if(AccountCubit.get(context).ratedTvShows.any((element) => element.id == tvShow.id)){
                                AccountCubit.get(context)
                                    .ratedTvShows
                                    .firstWhere(
                                        (element) => element.id == tvShow.id)
                                    .tvShowAccountDetails!
                                    .ratedValue =
                                    tvShow.tvShowAccountDetails!.ratedValue;
                                AccountCubit.get(context).update();
                              }
                              else {
                                AccountCubit.get(context)
                                    .ratedTvShows.add(tvShow);
                              }


                            }
                            Navigator.of(context).pop();
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
            icon: tvShow.tvShowAccountDetails!.ratedValue!=0.0 ? const Icon(
              Icons.star,
              color: Colors.yellow,
            ) : const Icon(
              Icons.star_border,
            ) ,
          ),
        );
      },
    );
  }
}